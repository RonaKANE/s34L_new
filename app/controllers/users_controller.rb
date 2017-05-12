class UsersController < ApplicationController

 #http_basic_authenticate_with name: "admin", password: "admin", except: [:index, :show]
 #before_action :logged_in_user, only: [:edit, :update]

def index
    @users = User.all
  end
 
  def show
    @user = User.find(params[:id])
    #debugger
  end
 
  def new
    @user = User.new
  end
 
  def edit
    @user = User.find(params[:id])
  end
 
  def create
  	#render plain: params[:user].inspect
    @user = User.new(user_params)
 
    if @user.save
    	#Log in the user once created	
    	log_in @user
      #Permet d'afficher un message de succès  (A compléter)
      flash[:success] = "Singed Up successfuly. Welcome !"
      redirect_to @user
    else
      render 'new'
    end
  end
 
  def update
    @user = User.find(params[:id])
 
    if @user.update(user_params)
      redirect_to @user
    else
      render 'edit'
    end
  end
 
  def destroy
    @user = User.find(params[:id])
    @user.destroy
 
    redirect_to users_path
  end
 
  private
	    def user_params
	      params.require(:user).permit(:user_id, :first_name, :last_name, :service, :user_tel, :user_mail, :office, :certificate_name, :password, :password_confirmation)
	    end
end
