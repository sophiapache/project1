class UsersController < ApplicationController
    def new
    @user = User.new
    end
    
    def create
    @user = User.new user_params
        if @user.save
            session[:user_id] = @user.id
            redirect_to root_path
        else 
        render :new
        end
    end

    def show
        @user = User.find params[:id]
    end

    def edit
        @user = User.find params[:id]
    end

    def update
        user = User.find params[:id]
        user.update profile_params
        user.save
        redirect_to user
    end


    private
    def user_params
        params.require(:user).permit(:email, :password, :password_confirmation)
    end

    def profile_params
        params.require(:user).permit(:name, :dob, :profpic, :favartists, :description)
    end
end  