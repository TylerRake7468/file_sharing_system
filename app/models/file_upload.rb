class FileUpload < ApplicationRecord
  belongs_to :user
  has_one_attached :file
  validates :file, presence: true
  validates :title, presence: true
  validates :file, presence: true
  before_create :generate_short_url


  def public_url
    Rails.application.routes.url_helpers.rails_blob_url(file, host: "http://localhost:3000")
  end

  def generate_short_url
    unless short_url.present?
      self.short_url = loop do
        random_code = SecureRandom.hex(4) # Generates an 8-character short URL
        break random_code unless FileUpload.exists?(short_url: random_code)
      end
    end
  end
end
