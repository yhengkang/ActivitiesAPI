class Activity < ActiveRecord::Base
  attr_accessible :activity_name, :vendor

  #add belongs_	to availability and dependent destroy

end
