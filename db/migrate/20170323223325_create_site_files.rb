class CreateSiteFiles < ActiveRecord::Migration[5.0]
  def change
    add_attachment :site_files, :certifications
  end
end
