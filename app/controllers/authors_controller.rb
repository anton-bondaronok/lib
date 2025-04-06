class AuthorsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[show]

  def show
    @author = Author.find(params[:id])
  end
end
