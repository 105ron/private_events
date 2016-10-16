class UsersController < ApplicationController
  
  def new
  	@user = User.new
  end
  
  def create
  	@user = User.new(user_params)
  	if @user.save
      log_in @user
      flash[:success] = "Welcome to PrivateEvents!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def show
    @user = current_user
    @attendees = @user.attendees
    #debugger
  end

  private

  	def user_params
  		params.require(:user).permit(:name, :email)
  	end

end
