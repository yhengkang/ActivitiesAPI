
##ACTIVITIES##
a1 = Activity.new(:activity_name => "Surfing", :vendor => "Joe")
a1.save

a2 = Activity.new(:activity_name => "Biking", :vendor => "Frank")
a2.save

##AVAILABILITIES

##SURFING
b1 = Availabilities.new(:activity_id => a1.id, :date => "2014-02-05", :start_time => "06:00", :end_time => "08:00", :price => 79.99, :spaces => 16)
b2 = Availabilities.new(:activity_id => a1.id, :date => "2014-02-05", :start_time => "08:30", :end_time => "10:30", :price => 79.99, :spaces => 16)
b3 = Availabilities.new(:activity_id => a1.id, :date => "2014-02-05", :start_time => "16:00", :end_time => "18:00", :price => 79.99, :spaces => 16)

b1.save
b2.save
b3.save

##BIKING
b4 = Availabilities.new(:activity_id => a2.id, :date => "2014-02-05", :start_time => "06:00", :end_time => "07:00", :price => 15.99, :spaces => 6)
b5 = Availabilities.new(:activity_id => a2.id, :date => "2014-02-12", :start_time => "06:00", :end_time => "07:00", :price => 15.99, :spaces => 6)
b6 = Availabilities.new(:activity_id => a2.id, :date => "2014-02-19", :start_time => "06:00", :end_time => "07:00", :price => 15.99, :spaces => 6)

b4.save
b5.save
b6.save