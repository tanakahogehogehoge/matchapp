class ChangeDatatypeStoreApplyIdOfMypusers < ActiveRecord::Migration
  def change
    change_column :mypusers, :store_apply_id, :string
  end
end
