class CartSerializer < ActiveModel::Serializer
  attributes :id, :sub_total, :tax, :discount_amount, :total, :cart_items, :available_discounts

  def cart_items
    object.cart_items.map do |cart_item|
      {
        id: cart_item.item.id,
        name: cart_item.item.name,
        quantity: cart_item.quantity,
        price: cart_item.item.price,
        tax: cart_item.item.tax_rate.to_f
      }
    end
  end

  def sub_total
    cart_items.inject(0){ |sum, x| sum + x[:price]  * x[:quantity] }
  end

  def tax
    cart_items.inject(0){ |sum, x| sum + (x[:tax]/100)  * x[:quantity] }
  end

  def available_discounts
    object.cart_discounts.map do |disc|
      {
          item_ids: disc.discount[:item_ids].split(',').map(&:to_i),
          rate: disc.discount[:discount_rate].to_f
      }
    end
  end

  def discount_amount
    discount = 0
    available_discounts.each do |disc|
      items = cart_items.select{|ci| disc[:item_ids].include? ci[:id]}
      discount += items.sum{|i| (i[:price] * i[:quantity]) * disc[:rate]/100}
    end
    discount
  end

  def total
    sub_total + tax - discount_amount
  end

end
