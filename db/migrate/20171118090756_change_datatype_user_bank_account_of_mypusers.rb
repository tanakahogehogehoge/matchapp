class ChangeDatatypeUserBankAccountOfMypusers < ActiveRecord::Migration
  def change
    change_column :mypusers, :user_bank_account, :string
  end
end
