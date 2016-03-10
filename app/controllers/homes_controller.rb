class HomesController < ApplicationController
  before_action :authenticate_user!
 # before_action :set_home, only: [:show, :edit, :update, :destroy]
  require 'csv' 
  def index
	@user = User.find(current_user.id)
	@lnventory = @user.lnventories
	i=0
	r=[]
	@lnventory.each do |ln|
		r[i] = ln.course_id
		i+=1
	end	
	@recommend = Recommendation.where(recommend_id: r).order("times DESC").limit(10)
  end

  def edit
	@user = User.find(current_user.id)
	@lnventory = @user.lnventories
  end

  def destroy
	@lnventory = Lnventory.where("user_id = %s AND course_id = %s ", current_user.id , params[:course_id])
	@lnventory[0].destroy
  end 

  def csv
	head = 'EF BB BF'.split(' ').map{|a|a.hex.chr}.join()
        csv_string = CSV.generate(csv=head) do |csv|

	title=['日期時間','星期一      ','星期二      ','星期三       ','星期四      ','星期五      ','星期六      ']
	csv << title
	arr=[];
	@lnventory = User.find(current_user.id).lnventories
		(1..14).each do |y|
        		if y==5 
                		arr.push('b')
        		elsif y>5
				k=y-1
				k=k.to_s
                		arr.push(k)
        		else
               			k=y.to_s
				arr.push(k)
			end
        			
        	(1..6).each do |x|
                	chack=(y-1)*6+x
			body=""
                 	@lnventory.each do |t| 
                         	t.course.locations.each do |k| 
                                 	if k.time == chack 
						body=body+
                                         	t.course.course_id.to_s.rjust(4,'0')+"\n"+
                                         	t.course.name + "\n" +
                                         	t.course.date+"\n" +
                                         	t.course.teacher
                                	 end 

                       		 end 
			end 
				arr.push(body)
		end 
			csv<<arr
			arr.clear
	end 
        end
        csv_string.force_encoding('utf-8')
        send_data csv_string, :filename => current_user.name+"的課表.csv"

  end

end
