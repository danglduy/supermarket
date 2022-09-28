class CheckoutItemsController < ApplicationController
  def index
    @checkout_items = CheckoutItem.all
    @total_price = calculate_total_price
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

  def calculate_total_price
    pricing_rules = {"A" => {quantity: 3, price: 130}, "B" => {quantity: 2, price: 45}}

    checkout_service = CheckoutService.new(pricing_rules)
    @checkout_items.each {|item| checkout_service.scan(item)}
    checkout_service.total_price
  end
end
