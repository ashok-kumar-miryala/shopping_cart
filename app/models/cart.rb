class Cart < ApplicationRecord
  has_many :items # , dependent: :destroy
  has_many :products, through: :items

  def sub_total
    sum = 0
    items.each do |item|
      sum += item.total_price
    end
    sum
  end
end
