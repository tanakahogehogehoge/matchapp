class AddImageCasheToEvents < ActiveRecord::Migration
  def change
    add_column :events, :Image_cashe, :string
  end
end
