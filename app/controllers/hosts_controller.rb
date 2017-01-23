class HostsController < ApplicationController

	def index
	@hosts = Host.all
	render @hosts
	end

	def create
    @user = User.find(params[:user_id])
    @host = @user.hosts.create(host_params)
    @host.inspect
    redirect_to user_path(@user)

  end
  def destroy
    @user = User.find(params[:user_id])
    @host = @user.hosts.find(params[:id])
    @host.destroy
    redirect_to user_path(@user)
  end
 
  private
    def host_params
      params.require(:host).permit(:hostname, :serial_number, :reference_orange, :location, :project_name, :brand, :model, :electricity_consumption, :state)
    end
end
