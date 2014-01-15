class AvailabilitiesController < ApplicationController

	def create
		@availability = Availability.new(params[:availability])
		if @availability.save
			render :json => @availability
		else
			render :json => @availability.errors.full_messages
		end
	end

	def destroy
		Availability.find(params[:id]).destroy
		render :json => {:head => :ok}
	end

	def index
		@availabilities = Availability.all
		render :json => @availabilities
	end

	def search
		start_date = params["start_date"]
		end_date = params["end_date"]

		if start_date && end_date
			#perform range search
			render :json => range_search(start_date, end_date)
		elsif start_date
			#perform single day search
			render :json => single_day_search(start_date)
		else
			render :json => {:status => :unproccessable_entity}
		end
	end

	def single_day_search(date)
		Availability.find_by_sql([<<-SQL, date])
			SELECT
				availabilities.*
			FROM
				availabilities
			WHERE
				availabilities.date = ?
		SQL
	end

	def range_search(start_date, end_date)
		Availability.find_by_sql([<<-SQL, start_date, end_date])
			SELECT
				availabilities.*
			FROM
				availabilities
			WHERE
				availabilities.date 
			BETWEEN
				? AND ?
		SQL
	end

end
