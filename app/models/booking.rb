class Booking < ActiveRecord::Base
  attr_accessible :availability_id, :guests, :user_id
  validates :availability_id, :guests, :presence => true

 	validate :availability_must_have_space

 	before_destroy :add_space_back

 	def availability_must_have_space
 		availability = Availability.find(self.availability_id)
 		if availability.spaces < self.guests
 			errors.add(:guests, "Too many guests for spots remaining")
 		else
 			#update spaces lef if valid
 			availability.update_attribute(:spaces, (availability.spaces - self.guests) )
 		end
 	end

 	def add_space_back
 		availability = Availability.find(self.availability_id)
 		availability.update_attribute(:spaces, (availability.spaces + self.guests) )
 	end

end
