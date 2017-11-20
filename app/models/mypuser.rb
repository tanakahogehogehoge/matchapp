class Mypuser < ActiveRecord::Base
  belongs_to :user
  validates :user_name, presence: true
  validates :user_address, presence: true
  validates :user_bank_account, presence: true
end
