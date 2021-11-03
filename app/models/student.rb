class Student < ApplicationRecord
    validates :name, presence:true, length:{minimum:5,maximum:50}
    before_save {self.email= email.downcase}
    VALID_EMAIL_REGEX= /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    validates :email, presence: true, uniqueness: true,format: {with: VALID_EMAIL_REGEX}
    has_secure_password
    has_many :student_courses
    has_many :courses, through: :student_courses
end