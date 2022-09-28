class CheckoutService
  # pricing_rules example: {"A" => {quantity: 3, price: 130}, "B" => {quantity: 2, price: 45}}
  def initialize(pricing_rules)
    @pricing_rules = pricing_rules
    @checkout_items = []
  end

  def scan(checkout_item)
    @checkout_items << checkout_item
  end

  def total_price
    price = 0
    special_price_skus = pricing_rules.keys
    special_price_items, non_special_price_items =
      checkout_items.partition do |checkout_item|
        special_price_skus.include?(checkout_item.product.sku)
      end

    non_special_price_items.each do |item|
      price += item.product.unit_price
    end

    grouped_count_special_price_items =
      special_price_items.group_by {|item| item.product[:sku]}
                         .transform_values(&:count)


    grouped_count_special_price_items.each do |sku, count|
      special_priced_count = count.div(pricing_rules[sku][:quantity])
      non_special_price_count = count % pricing_rules[sku][:quantity]

      price += Product.find_by(sku: sku).unit_price * non_special_price_count
      price += special_priced_count * pricing_rules[sku][:price]
    end

    price
  end

  private

  attr_reader :pricing_rules, :checkout_items
end
