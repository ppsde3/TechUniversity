class  Course < ApplicationRecord
    validates :name, presence:true, length:{minimum:5, maximum:50}
    validates :short_name, presence:true, length:{minimum:3, maximum:100}
    validates :description, presence:true, length:{minimum:10, maximum:500}
    has_many :student_courses
    has_many :students, through: :student_courses
end