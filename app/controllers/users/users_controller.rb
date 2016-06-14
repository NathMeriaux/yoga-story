class UsersController < ApplicationController
  after_action :verify_authorized

  def index
    @users = User.all
  end

  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = User.find(params[:id])
    authorize user
    if @user.update(user_params)
      redirect_to user_path
    else
      flash[:alert] = t('.flash_alert')
    end
  end


private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :password, :email, :street, :city, :zipcode, :country, :phone, :gender, :birth_date, :photo, :photo_cache, :yoga_type, :level)
  end

end
