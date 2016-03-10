class SearchsController < ApplicationController
	def show
		@courses = Course.where("`course_id` = ?  or `name` LIKE ?  or `teacher` LIKE ? ",params[:q],"%#{params[:q]}%","%#{params[:q]}%")
	end
end
