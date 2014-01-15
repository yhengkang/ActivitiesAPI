class BookingsController < ApplicationController

	def create
		@booking = Booking.new(params[:booking])
		availability_id = params[:booking][:availability_id]
		begin
			@booking.transaction do
				@booking.save
				#modify availability spaces left
				@availability = Availability.find(availability_id)
				@availability.update_attribute(:spaces, (@availability.spaces - @booking.guests) )
			end
			render :json => @booking
		rescue ActiveRecord::RecordInvalid => invalid
			render :json => @booking.errors.full_messages
		end
	end

	def destroy

	end
end
