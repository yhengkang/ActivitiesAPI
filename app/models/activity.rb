class Activity < ActiveRecord::Base
  attr_accessible :activity_name, :vendor
  validates :activity_name, :vendor, :presence => true
  validates :activity_name, :uniqueness => {:scope => :vendor, 
  	:message => "Should not have the same combination of vendor and activity"}

  has_many :availabilities, :dependent => :destroy
end
