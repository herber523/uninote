class GroupsController < ApplicationController
	def index
	end
	def show
		@course = Course.find(params[:id])
		@group = @course.groups.new
		course_id = @course.course_id.to_s.rjust(4,'0')
		term = @course.year.to_s.last
		year = @course.year.to_s[0..2]
		@uri = "http://140.128.97.216/102/teac2_desc/outline4/print_outline.php?setyear=#{year}&setterm=#{term}&curr_code=#{course_id}&ss_sysid=otr"
		@groups = @course.groups
		if @groups.count > 0
		@group_num = (@course.groups.average(:num_1) + @course.groups.average(:num_2))/2
		@group_num1 = @course.groups.average(:num_1)
		@group_num2 = @course.groups.average(:num_2)
		end
	end
 	def create
    		@course = Course.find(params[:course_id])
    		@group = @course.groups.build(post_params)
    		@group.user_id = current_user.id
    		@group.save
	end
private
def post_params
     params.require(:group).permit(:num_1,:num_2,:num_3, :comment)
end
end
