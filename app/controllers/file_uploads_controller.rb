require 'tinyurl'
class FileUploadsController < ApplicationController
    before_action :authenticate_user!, except: [:access_via_short_url]

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
      su = @file_upload.short_url.present? ? @file_upload.short_url : @file_upload.generate_short_url 
      @short_url = short_url_url(su) # Generate full short URL
    end

    def access_via_short_url
      @file_upload =FileUpload.where(short_url: params[:short_url]).last
      if @file_upload.present?
        redirect_to rails_blob_url(@file_upload.file, host: request.base_url) # Redirect to actual file
      else
        render plain: "File not found", status: :not_found
      end
    end

    def show
      @file_upload = FileUpload.find(params[:id])
    end

    private
  
    def file_upload_params
      params.require(:file_upload).permit(:title, :description, :file)
    end
end
