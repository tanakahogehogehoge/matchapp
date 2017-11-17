class CreateMypowners < ActiveRecord::Migration
  def change
    create_table :mypowners do |t|
      t.string :owner_name
      t.string :owner_address
      t.integer :owner_bank_account
      t.timestamps null: false
    end
  end
end
