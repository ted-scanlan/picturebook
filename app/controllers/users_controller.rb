class UsersController < ApplicationController
  def index
  end

  def show
  end

  def create
    @user = User.create(user_params)

    if @user.save
      flash[:notice] = "you have signed up!"
        redirect_to '/'
    else

         render 'new'    #how does it know when email has been taken? where is it looking in the database and checking?

    end

  end

  def new
    @user = User.new
  end


  def user_params

  params.require(:user).permit(:username, :email, :password, :password_confirmation)

  end
end
