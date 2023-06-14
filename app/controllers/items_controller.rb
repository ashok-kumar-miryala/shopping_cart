class ItemsController < ApplicationController
	  # before_action :authenticate_user, only: %i[create destroy add_quantity
                                          # reduce_quantity]

  def create
    # Find associated product and current cart
    chosen_product = Product.find(params[:product_id])
    add_items_to_cart(chosen_product)
    respond_to do |format|
      if @item.save!
        format.html { redirect_back(fallback_location: @current_cart) }
        format.js
      else
        format.html { render :new, notice: 'Error adding product to basket!' }
      end
    end
  end

  def destroy
    @item = LineItem.find(params[:id])
    @item.destroy
    redirect_back(fallback_location: @current_cart)
  end

  def add_quantity
    @item = LineItem.find(params[:id])
    @item.quantity += 1
    @item.save
    redirect_back(fallback_location: @current_cart)
  end

  def reduce_quantity
    @item = LineItem.find(params[:id])
    if @item.quantity > 1
      @item.quantity -= 1
      @item.save
      redirect_back(fallback_location: @current_cart)
    elsif @item.quantity == 1
      destroy
    end
  end

  private

  def item_params
    params.require(:item).permit(:quantity, :product_id, :cart_id)
  end

  def add_items_to_cart(chosen_product)
    # If cart already has this product then find the relevant item
    # and iterate quantity otherwise create a new item for this product
    if @current_cart.products.include?(chosen_product)
      # Find the item with the chosen_product
      @item = @current_cart.items.find_by(product_id: chosen_product)
      # Iterate the item's quantity by one
      @item.quantity += 1
    else
      @item = Item.new
      @item.cart = @current_cart
      @item.product = chosen_product
      # @item.order = Order.first
      @item.quantity = 1
    end
  end
end
