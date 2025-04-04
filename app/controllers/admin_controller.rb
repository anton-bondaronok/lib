class AdminController < ApplicationController
  before_action :authenticate_admin!

  protected

  def authenticate_admin!
    redirect_to root_path, alert: "Not authorized" unless current_user.super_admin? || current_user.librarian?
  end
end
