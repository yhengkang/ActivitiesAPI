class BookingsController < ApplicationController

	#should move the availability space updates to model layer of bookings

	def create
		@booking = Booking.new(params[:booking])
		if @booking.save
			render :json => @booking
		else
			render :json => @booking.errors.full_messages
		end
	end

	def destroy
		Booking.find(params[:id]).destroy
		render :json => {:head => :ok}
	end

	def index
		@bookings = Booking.all
		render :json => @bookings
	end
	
end
