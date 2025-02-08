require 'tinyurl'
class FileUploadsController < ApplicationController
    before_action :authenticate_user!

    def index
      @files = current_user.file_uploads
    end
  
    def new
      @file_upload = FileUpload.new
    end
  
    def create
      @file_upload = current_user.file_uploads.new(file_upload_params)
      if @file_upload.save
        redirect_to file_uploads_path, notice: "File uploaded successfully!"
      else
        render :new
      end
    end
  
    def destroy
      @file_upload = current_user.file_uploads.find(params[:id])
      @file_upload.destroy
      redirect_to file_uploads_path, notice: "File deleted successfully!"
    end

    def share
        @file_upload = current_user.file_uploads.find(params[:id])
        tiny_url = Tinyurl.shorten(file_upload_url(@file_upload))
        redirect_to file_uploads_path, notice: "File shared! Here is your tiny URL: #{tiny_url}"
    end

    private
  
    def file_upload_params
      params.require(:file_upload).permit(:title, :description, :file)
    end
end
