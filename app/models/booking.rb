class Booking < ActiveRecord::Base
  attr_accessible :availability_id, :guests, :user_id
  validates :availability_id, :guests, :presence => true

 	#custom validation to check if the availability has enough spaces left
end
