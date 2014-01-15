class Availability < ActiveRecord::Base
  attr_accessible :activity_id, :date, :start_time, :end_time, :price, :spaces
  validates :activity_id, :date, :start_time, :end_time, :price, :spaces, :presence => true
  #needs custom validation for overlapping of times
 	#what if the same classes is offered by the same vendor, at overlapping times, by different instructors?


end
