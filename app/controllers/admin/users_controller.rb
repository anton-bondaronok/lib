class Admin::UsersController < AdminController
  before_action :set_user, except: %i[index new create]
  before_action :authenticate_super_admin!, except: %i[index]

  def index
    @users = User.all
    @users = @users.where(role: "user") if current_user.librarian?
    @users = @users.where("full_name ILIKE :q OR email ILIKE :q", q: "%#{params[:query]}%")  if params[:query].present?
    @users = @users.order(created_at: :desc)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to admin_user_path(@user), notice: "Пользователь был успешно создан"
    else
      render :edit
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to admin_user_path(@user), notice: "Пользователь был успешно обновлен"
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to admin_users_path, notice: "Пользователь был успешно удален"
  end

  def confirm
    @user.touch(:confirmed_at)
    redirect_to admin_user_path(@user), notice: "Пользователь был успешно подтвержден"
  end

  def lock
    @user.touch(:locked_at)
    redirect_to admin_user_path(@user), notice: "Пользователь был успешно заблокирован"
  end

  def unlock
    @user.update(locked_at: nil)
    redirect_to admin_user_path(@user), notice: "Пользователь был успешно разблокирован"
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

  def authenticate_super_admin!
    return if @user&.user?

    redirect_to admin_users_path, alert: "Not authorized" unless current_user.super_admin?
  end
end
