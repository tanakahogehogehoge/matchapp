class CreateMypusers < ActiveRecord::Migration
  def change
    create_table :mypusers do |t|
      t.string :user_name
      t.string :user_address
      t.integer :user_bank_account
      t.timestamps null: false
    end
  end
end
