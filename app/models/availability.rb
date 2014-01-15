class Availability < ActiveRecord::Base
  attr_accessible :activity_id, :date, :start_time, :end_time, :price, :spaces
end
