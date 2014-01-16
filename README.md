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
RestClient.delete(availability_endpoint + #{id})
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










