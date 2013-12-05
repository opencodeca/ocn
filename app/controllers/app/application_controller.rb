class App::ApplicationController < ::ApplicationController
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

protected

  def ensure_current_user
    redirect_to :back, alert: t('.not_signed_in') unless current_user
  end
end
