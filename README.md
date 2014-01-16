## ActivitiesAPI

Use Addressable/URI and RestClient to make requests easier.

### Activities
#### ADDING:
````
activity_endpoint = Addressable::URI.new(
	:scheme => "http",
	:host => "localhost:3000",
	:path => "activities"
).to_s
activity_params = { :activity=> { :activity_name => "Surfing", :vendor => "Joe" } }

RestClient.post(activity_endpoint, activity_params)
````
#### DELETING:
````
RestClient.delete("http://localhost:3000/activities/1")
````
OR
````
RestClient.delete(activity_endpoint + "/#{id}")
````


### Availabilities
#### ADDING:
````
availability_endpoint = Addressable::URI.new(
	:scheme => "http",
	:host => "localhost:3000",
	:path => "availabilities"
).to_s
availability_params = { :availability => {:activity_id => 1, :date => "2014-05-25", :start_time => "14:00", :end_time => "16:00", :price => 70.99, :spaces => 16}}

RestClient.post(availability_endpoint, availability_params)
````
#### DELETING: 
````
RestClient.delete("http://localhost:3000/availabilities/1")
````
OR 
````
RestClient.delete(availability_endpoint + "#{id}")
````


### Bookings
#### ADDING:
````
booking_endpoint = Addressable::URI.new(
	:scheme => "http",
	:host => "localhost:3000",
	:path => "bookings"
).to_s

booking_params = { :booking => {:availability_id => 1, :guests => 10} }

RestClient.post(booking_endpoint, booking_params)
````
#### DELETING:
````
RestClient.delete("http://localhost:3000/bookings/1")
````
OR
````
RestClient.delete(booking_endpoint + "/#{:id}")
````


### SEARCHING:
````
search_endpoint = Addressable::URI.new(
	:scheme => "http",
	:host => "localhost:3000",
	:path => "availabilities/search",
	:query_values => {:start_date => "2014-02-01", :end_date => "2014-2-30"}
).to_s

response = RestClient.get(search_endpoint)
````
For single day searches, just put  the target date as start date, and nil for end_date

### TESTS:
-There are two tests, model_specs.rb, and search_specs.rb, both of which are located in specs.
-Both tests rely on initial seed data, and can be run using rspec
-If there are problems with either, drop the database, remigrate and reseed, though it should work fine.
-Tests are verified by getting the list of models back and comparing it to a number, so it isn't exactly thorough

-send a 'get' request to any of the endpoints to get a list of the models

### NOTES:
- Issues
	- start_time and end_time include dates, for some reason, even though I used the time datatype, could be because of sqlite3
	- multiple availabilities can be booked on the same time, for the same activity, but I don't know if I should enforce uniqueness due to multiple instructors offering the same event for the same vendor being a possibility
	- tests could be better written

-Idea for implementation of 'recurring' classes/events
	- add a additional 'recurring' column to availability table
	- have a day, say 'Monday' stored in the column
	- booking will then have to accept a new parameter 'date'
	- have a before filter to check if the class is recurring when creating booking
		- if it is, and date from booking matches day in recurring column, create a new availability and assign that to the booking
		- if it isnt, then raise error
	- problem is if it is a Monday, Wednesday, Friday repetition, then a new event has to be created for each weekly repetition
	- also there might be problems with trying to figure out if the dates match between booking and the recurring dates
