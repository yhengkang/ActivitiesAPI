class AvailabilitiesController < ApplicationController

	def create
		@availability = Availability.new(params[:availability])
		if @availability.save
			render :json => @availability
		else
			render :json => @availability.errors.full_messages
			p @availability.errors.full_messages
		end
	end

	def destroy

	end

end
