class BookingsController < ApplicationController

	#should move the availability space updates to model layer of bookings
	
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
		@booking = Booking.find(params[:id])
		availability_id = @booking.availability_id
		begin
			@booking.transaction do
				@availability = Availability.find(availability_id)
				@availability.update_attribute(:spaces, (@availability.spaces + @booking.guests) )
				@booking.destroy
			end
			render :json => {:head => :ok}
		rescue ActiveRecord::RecordInvalid => invalid
			render :json => {:status => :unprocessable_entity}
		end
	end
end
