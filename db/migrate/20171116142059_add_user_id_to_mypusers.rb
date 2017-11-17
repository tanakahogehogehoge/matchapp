class AddUserIdToMypusers < ActiveRecord::Migration
  def change
    add_column :mypusers, :user_id, :integer
  end
end
