class Admin::UsersController < ApplicationController
    
  def index
    if current_user.admin
      @users = User.all.page(params[:page]).per(10)
    else
      flash[:alert] = "You must be an Admin to view the Users page!"
      redirect_to movies_path
    end
  end

  def destroy
    @user = User.find(params[:id])
    
    UserMailer.delete_email(@user).deliver_later

    @user.reviews.each do |review|
      review.destroy
    end
    @user.destroy

    flash[:notice] = "User #{@user.full_name} deleted from database"
    redirect_to admin_users_path
  end
  
end
