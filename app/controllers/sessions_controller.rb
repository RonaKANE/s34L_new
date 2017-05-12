class SessionsController < ApplicationController

skip_before_action :require_login, only: [:new, :create]
  def new
  end
  def create
  	user = User.find_by(user_id: params[:session][:user_id].downcase)
    if user && user.authenticate(params[:session][:password])
      # Log the user in and redirect to the user's show page.
      log_in user
      redirect_to user
    else
      flash.now[:danger] = 'Invalid User ID/password combination'
      render 'new'
    end
  end
  def destroy
  	log_out
  	redirect_to root_path
  end
end
