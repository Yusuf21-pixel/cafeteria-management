class Order < ActiveRecord::Base
  has_many :order_items
  belongs_to :user

  def self.date_range(first_date, last_date)
    all.where("date >= ? AND date <= ?", first_date, last_date)
  end

  def self.tot_amount(id)
    order = Order.find(id)
    sum = 0
    order.order_items.each do |x|
      sum += (x.quantity * x.menu_item_price).round(2)
    end
    return sum.round(2)
  end
end
