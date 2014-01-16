require 'rspec'
require 'rest-client'
require 'addressable/uri'
require 'json'


def activity_url
	Addressable::URI.new(
		:scheme => "http",
		:host => "localhost:3000",
		:path => "activities"
	).to_s
end

def availability_url
	Addressable::URI.new(
		:scheme => "http",
		:host => "localhost:3000",
		:path => "availabilities"
	).to_s
end

def booking_url
	Addressable::URI.new(
		:scheme => "http",
		:host => "localhost:3000",
		:path => "bookings"
	).to_s
end

describe "Activity" do
	it "should be able to add a new activity" do
		params = {:activity => {:activity_name => "new event", :vendor => "new vendor"} } 
		RestClient.post(activity_url, params)
		response =  RestClient.get(activity_url)
		json = JSON.parse(response.body)

		expect(json.length).to eq(3)
	end

	it "should be able to delete an activity" do
		activity_id = JSON.parse(RestClient.get(activity_url)).last["id"]
		RestClient.delete(activity_url + "/#{activity_id}")

		response = RestClient.get(activity_url)
		json = JSON.parse(response.body)

		expect(json.length).to eq(2)
	end

	it "should prevent invalid activites from being created" do
		params = {:activity => {:activity_name => nil, :vendor => nil} } 
		RestClient.post(activity_url, params)
		response =  RestClient.get(activity_url)
		json = JSON.parse(response.body)

		expect(json.length).to eq(2)
	end
end

describe "Availability" do 
	it "should be able to add a new availability" do
		params = { :availability => {:activity_id => 1, :date => "2014-05-25", :start_time => "14:00", :end_time => "16:00", :price => 70.99, :spaces => 16}}
		RestClient.post(availability_url, params)

		response = RestClient.get(availability_url)
		json = JSON.parse(response.body)

		expect(json.length).to eq(7)
	end

	it "should be able to delete a availability" do
		availability_id = JSON.parse(RestClient.get(availability_url)).last["id"]
		RestClient.delete(availability_url + "/#{availability_id}")

		response = RestClient.get(availability_url)
		json = JSON.parse(response.body)

		expect(json.length).to eq(6)
	end

	it "should not be able to create a class with no spots" do
		params = { :availability => {:activity_id => 1, :date => "2014-05-25", :start_time => "14:00", :end_time => "16:00", :price => 70.99, :spaces => 0}}
		RestClient.post(availability_url, params)

		response = RestClient.get(availability_url)
		json = JSON.parse(response.body)

		expect(json.length).to eq(6)
	end

end


describe "Booking" do
	it "should be able to book a time" do
		params = { :booking => {:availability_id => 1, :guests => 10} }
		RestClient.post(booking_url, params)

		response = RestClient.get(booking_url)
		json = JSON.parse(response.body)

		expect(json.length).to eq(1)
	end

	it "should reduce space in the booked event" do
		spaces = JSON.parse(RestClient.get(availability_url)).first["spaces"]
		expect(spaces).to eq(6)
	end

	it "should should be able to delete the booked time" do
		booking_id = JSON.parse(RestClient.get(booking_url)).last["id"]
		RestClient.delete(booking_url + "/#{booking_id}")

		response = RestClient.get(booking_url)
		json = JSON.parse(response.body)

		expect(json.length).to eq(0)
	end
	it "should re-add the space back to the booked time" do
		spaces = JSON.parse(RestClient.get(availability_url)).first["spaces"]
		expect(spaces).to eq(16)
	end

end



