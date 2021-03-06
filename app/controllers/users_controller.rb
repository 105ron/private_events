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
    @user = User.find(params[:id])
    @users_events = @user.upcoming_events
    @past_users_events = @user.past_events
    #debugger
  end

  private

  	def user_params
  		params.require(:user).permit(:name, :email)
  	end

end
