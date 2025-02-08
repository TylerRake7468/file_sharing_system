class FileUpload < ApplicationRecord
  belongs_to :user
  has_one_attached :file
  validates :file, presence: true
  validates :title, presence: true
  validates :file, presence: true

  def public_url
    Rails.application.routes.url_helpers.rails_blob_url(file, host: "http://localhost:3000")
  end
end
