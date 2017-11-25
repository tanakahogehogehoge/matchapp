class RenameImageCasheColumnToEvents < ActiveRecord::Migration
  def change
    rename_column :events, :Image_cashe, :image_cashe
  end
end
