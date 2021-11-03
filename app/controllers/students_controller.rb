class StudentsController < ApplicationController
    skip_before_action :require_user, only: [:new, :create]
    before_action :set_student, only: [:edit, :update, :show]
    before_action :require_same_user, only: [:edit, :update]

    def index
        @students= Student.all
    end

    def new
        @student = Student.new
    end

    def create
        @student= Student.new(student_params)
        if @student.save
            flash[:success]= "Signed UP Successfully."
            redirect_to root_path
        else
            render 'new'
        end

    end

    def show

    end

    def edit

    end

    def update
        if @student.update(student_params)
            flash[:notie]= "Profile Updated Suessfully"
            redirect_to student_path(@student)
        else
            render 'edit'
        end

    end

    private

    def set_student
        @student= Student.find(params[:id])
    end


    def student_params
        params.require(:student).permit(:name, :email)
    end

    def require_same_user
        if current_user != @student
            flash[:notice]="You can only edit your profile"
            redirect_to student_path(current_user)
        end
    end
    
    
    
end