class AddStoreapplyIdToMypusers < ActiveRecord::Migration
  def change
    add_column :mypusers, :store_apply_id, :integer
  end
end
