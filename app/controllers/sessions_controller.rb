class SessionsController < ApplicationController
  
  def new
  
  end

  def create
  	if user = User.find_by(email: params[:session][:email].downcase)
      log_in user
      redirect_to user
  	else
  		flash.now[:danger] = "Couldn't find your email. Need to register?" # Not quite right!
      render 'new'
  	end
  end

  def destroy
    log_out
    redirect_to root_url
  end

end
