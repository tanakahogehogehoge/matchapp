class Event < ActiveRecord::Base
   validates :store_address, presence: true
   validates :store_info, length: { in: 1..1000 }
   validates :store_info_sub, length: { in: 1..255 }

   belongs_to :user
end
