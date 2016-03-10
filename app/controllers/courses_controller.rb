class CoursesController < ApplicationController
	def index
	end
	def show
		@department = Department.find(params[:id])
		@courses = Course.where("department_id = ?",params[:id])	
	end
	def create
		@course = Lnventory.where(:user_id => current_user.id , :course_id => params[:course_id]).first_or_create
	end

end
