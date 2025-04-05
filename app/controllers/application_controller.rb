class ApplicationController < ActionController::Base
  include Pagy::Backend

  allow_browser versions: :modern
  layout "application"

  before_action :authenticate_user!
end
