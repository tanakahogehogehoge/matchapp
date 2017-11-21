class Mypowner < ActiveRecord::Base
  belongs_to :owner
  validates :owner_name, presence: true
  validates :owner_address, presence: true
  validates :owner_bank_account, presence: true
end
