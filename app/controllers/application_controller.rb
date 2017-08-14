class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def require_admin
    unless current_user.admin
      redirect_to root_path
      flash[:alert] = 'You are not admin!'
    end
  end

  helper_method :current_cart

  def current_cart
    @current_cart ||= find_cart
  end

  private

  def find_cart
    cart = Cart.find_by(id: session[:cart_id])
    cart = Cart.create if cart.blank?
    session[:cart_id] = cart.id
    cart
  end

  before_action :set_locale

  def set_locale
    if params[:locale] && I18n.available_locales.include?(params[:locale].to_sym)
      session[:locale] = params[:locale]
    end

    I18n.locale = session[:locale] || I18n.default_locale
  end

  before_action :set_timezone

  def set_timezone
    Time.zone = current_user.time_zone if current_user && current_user.time_zone
  end
end
