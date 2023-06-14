class HomeController < ApplicationController

  def index
    if user_signed_in?
      @current_user = current_user
    end
    fetch_products
    fetch_cart_items
  end

  def products; end

  def about; end

  def contact; end

  private

  def fetch_products
    @products = if params[:search]
                  Product.search(params[:search])
                         .order('created_at ASC')
                         
                else
                  Product.order('created_at ASC')
                         
                end
  end

   def fetch_cart_items
    @cart_items = Cart.where(user_id: current_user.id).order('created_at ASC')
  end

end
