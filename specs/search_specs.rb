require 'rspec'
require 'rest-client'
require 'addressable/uri'
require 'json'

def search_url(start_date = nil, end_date = nil)
	Addressable::URI.new(
		:scheme => "http",
		:host => "localhost:3000",
		:path => "availabilities/search",
		:query_values => {:start_date => start_date, :end_date => end_date}
	).to_s
end

describe "Search function" do
	it 'searches for range properly' do
		response = RestClient.get(search_url("2014-02-01", "2014-02-30"))
		json = JSON.parse(response.body)
		expect(json.length).to eq(6)
	end

	it 'searches for a singular date properly' do
		response = RestClient.get(search_url("2014-02-05"))
		json = JSON.parse(response.body)		
		expect(json.length).to eq(3)
	end

	it 'will return nothing for dates with no events' do
		response = RestClient.get(search_url("2014-02-01", "2014-02-04"))
		json = JSON.parse(response.body)
		expect(json.length).to eq(0)
	end

	it 'will return nothing for one date with no events' do
		response = RestClient.get(search_url("2014-02-01"))
		json = JSON.parse(response.body)
		expect(json.length).to eq(0)
	end

end