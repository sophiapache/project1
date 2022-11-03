class UsersController < ApplicationController
    # create new user
    def new
    @user = User.new
    end
    
    # insert user params into user
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

    # update user params
    def update
        user = User.find params[:id]

        if params[:file].present?
            req = Cloudinary::Uploader.upload params[:file]
            user.profpic = req["public_id"]
            user.save
        end

        user.update profile_params
        user.save
        redirect_to user
    end

    private
    def user_params
        params.require(:user).permit(:email, :username, :password, :password_confirmation)
    end

    def profile_params
        params.require(:user).permit(:name, :dob, :profpic, :favartists, :description)
    end
end  