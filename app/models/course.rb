class Course < ActiveRecord::Base
	has_many :lnventories
        has_many :locations
        has_many :groups
	has_one :syllabus
end
