class CreateSiteFiles < ActiveRecord::Migration[5.0]
  def change
    create_table :site_files do |t|
      t.timestamps
    end
  end
end
