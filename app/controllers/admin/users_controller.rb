class Admin::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_admin!
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    if params[:role].present?
      @users = User.where(role: params[:role])
    else
      @users = User.all
    end
  end

  def show; end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      UserMailer.account_created(@user).deliver_now
      redirect_to admin_user_path(@user), notice: "User created successfully and email sent."
    else
      render :new
    end
  end

  def edit; end

  def update
    if @user.update(user_params_for_update)
      redirect_to admin_user_path(@user), notice: "User updated successfully."
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      flash[:notice] = "User and all associated records deleted successfully."
    else
      flash[:alert] = "Failed to delete user."
    end
    redirect_to admin_users_path
  rescue ActiveRecord::InvalidForeignKey => e
    flash[:alert] = "Cannot delete user: they have associated records that must be removed first."
    redirect_to admin_users_path
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :role, :password, :password_confirmation, :department_id)
  end

  def user_params_for_update
    # If password is blank, exclude it from params
    if params[:user][:password].blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end
    params.require(:user).permit(:email, :role, :password, :password_confirmation, :department_id)
  end

  def authorize_admin!
    redirect_to root_path, alert: "Access denied!" unless current_user.role == "admin"
  end
end
