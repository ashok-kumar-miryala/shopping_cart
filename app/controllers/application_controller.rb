class ApplicationController < ActionController::Base
	 protect_from_forgery with: :exception
	 before_action :authenticate_user!, except: [:welcome, :about]

	  before_action :set_cart

  private

  def set_cart
    if session[:cart_id]
      cart = Cart.find_by(id: session[:cart_id])
      cart.present? ? (@current_cart = cart) : (session[:cart_id] = nil)
    end
    return unless session[:cart_id].nil?

    @current_cart = Cart.create(user_id: nil)
    session[:cart_id] = @current_cart.id
  end

  def user_is_admin
    return if user_signed_in? && current_user.admin?

    flash[:info] = "You don't have the privilages for this action!"
    redirect_back(fallback_location: root_url)
  end
  
end
