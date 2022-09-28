class CheckoutItemsController < ApplicationController
  def index
    @checkout_items = CheckoutItem.all
  end

  def create
    checkout_item = CheckoutItem.new(checkout_item_params)

    if checkout_item.save
      redirect_to checkout_items_path
    end
  end

  private

  def checkout_item_params
    params.require(:checkout_item).permit(:product_id)
  end
end
