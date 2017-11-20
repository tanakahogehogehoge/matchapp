class ChangeDatatypeOwnerBankAccountOfMypowners < ActiveRecord::Migration
  def change
    change_column :mypowners, :owner_bank_account, :string
  end
end
