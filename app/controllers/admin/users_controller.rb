class Admin::UsersController < AdminController
  before_action :set_user, except: %i[index new create]

  def index
    @users = if params[:query].present?
      User.where("full_name ILIKE :q OR email ILIKE :q", q: "%#{params[:query]}%")
    else
      User.all
    end.order(created_at: :desc)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to admin_user_path(@user), notice: "User created"
    else
      render :edit
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to admin_user_path(@user), notice: "User updated"
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to admin_users_path, notice: "User deleted"
  end

  def confirm
    @user.touch(:confirmed_at)
    redirect_to admin_user_path(@user), notice: "User confirmed"
  end

  def lock
    @user.touch(:locked_at)
    redirect_to admin_user_path(@user), notice: "User locked"
  end

  def unlock
    @user.update(locked_at: nil)
    redirect_to admin_user_path(@user), notice: "User unlocked"
  end

  private

  def user_params
    params.require(:user).permit(:full_name, :email, :role, :password, :password_confirmation).tap do |user_params|
      next if user_params[:password].present?

      user_params.delete("password")
      user_params.delete("password_confirmation")
    end
  end

  def set_user
    @user = User.find(params[:id])
  end
end
