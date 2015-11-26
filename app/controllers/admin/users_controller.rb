class Admin::UsersController < ApplicationController
  
  before_filter :admin?

  def index
    if current_user.admin
      @users = User.all.page(params[:page]).per(10)
    else
      flash[:alert] = "You must be an Admin to view the Users page!"
      redirect_to movies_path
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    byebug

    if @user.save
      redirect_to admin_users_path
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes(user_params)
      redirect_to admin_users_path
    else
      render :edit
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

  protected

  def admin?
    unless current_user.admin
      
    end
  end

  def user_params
    params.require(:user).permit(:email, :firstname, :lastname, :admin, :password, :password_confirmation)
  end
  
end
