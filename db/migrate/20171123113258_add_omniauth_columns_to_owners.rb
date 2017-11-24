class AddOmniauthColumnsToOwners < ActiveRecord::Migration
  def change
    add_column :owners, :uid, :string, null: false, default: ""
    add_column :owners, :provider, :string, null: false, default: ""
    add_column :owners, :image_url, :string

    add_index :owners, [:uid, :provider], unique: true
  end
end
