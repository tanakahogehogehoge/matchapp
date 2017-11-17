class AddOwnerIdToMypowners < ActiveRecord::Migration
  def change
    add_column :mypowners, :owner_id, :integer
  end
end
