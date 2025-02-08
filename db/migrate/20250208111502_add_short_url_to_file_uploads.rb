class AddShortUrlToFileUploads < ActiveRecord::Migration[7.1]
  def change
    add_column :file_uploads, :short_url, :string
    add_index :file_uploads, :short_url, unique: true
  end
end
