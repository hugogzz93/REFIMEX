class AddAttachmentFileToSiteFiles < ActiveRecord::Migration[5.0]
  def up
  	add_column :site_files, :certification_file_name, :string
  	add_column :site_files, :certification_content_type, :string
  	add_column :site_files, :certification_file_size, :integer
  	add_column :site_files, :certification_updated_at, :datetime
  end

  def down
  	add_column :site_files, :certification_file_name, :string
  	add_column :site_files, :certification_content_type, :string
  	add_column :site_files, :certification_file_size, :integer
  	add_column :site_files, :certification_updated_at, :datetime
  end
end
