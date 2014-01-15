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
		Activity.find(params[:id]).destroy
		render :json => {:head => :ok}
	end

	def index
		@activities = Activity.all
		render :json => @activities
	end

end
