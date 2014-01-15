class ActivitiesController < ApplicationController

	def create
		@activity = Activity.new(params[:activity])
		if @activity.save
			render :json => @activity
		else
			render :json => @activity.errors.full_messages
		end
	end

	def destroy

	end

end
