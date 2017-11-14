class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :store_address
      t.text :store_info
      t.string :store_info_sub
      t.string :store_picture

      t.timestamps null: false
    end
  end
end
