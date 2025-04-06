class ProfilesController < ApplicationController
  def bookings
  end

  def show
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to edit_profile_path, notice: "Profile updated"
    else
      render :edit
    end
  end

  def destroy
    current_user.destroy
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:full_name, :email, :password, :password_confirmation).tap do |user_params|
      next if user_params[:password].present?

      user_params.delete("password")
      user_params.delete("password_confirmation")
    end
  end
end
