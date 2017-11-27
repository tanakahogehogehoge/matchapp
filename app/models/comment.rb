class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :owner
  belongs_to :event
end
