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

