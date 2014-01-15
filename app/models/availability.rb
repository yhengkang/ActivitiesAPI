class Availability < ActiveRecord::Base
  attr_accessible :activity_id, :date, :start_time, :end_time, :price, :spaces
  validates :activity_id, :date, :start_time, :end_time, :price, :spaces, :presence => true
  validates :spaces, :numericality => {:greater_than => 0}
  
  #needs custom validation for overlapping of times
 	#what if the same classes is offered by the same vendor, at overlapping times, by different instructors?

 	has_many :bookings, :dependent => :destroy
end
