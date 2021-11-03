class LoginsController < ApplicationController
    skip_before_action :require_user, only: [:new, :create]

    def new

    end

    def create
        student = Student.find_by(email: params[:logins][:email].downcase)
        if student && student.authenticate(params[:logins][:password])
            session[:student_id]= student.id
            flash[:notie]="Successfully Logged In !"
            redirect_to root_path
        else
            flash.now[:notice]=" Something went wrong! "
            render 'new'
        end
    end
    
    def destroy
        session[:student_id]= nil
        flash[:notice]="Logged Out"
    end
    
end