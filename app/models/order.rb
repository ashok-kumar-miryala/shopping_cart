class Order < ApplicationRecord
 has_many :items, dependent: :destroy

  belongs_to :user
 

  def sub_total
    sum = 0
    items.each do |item|
      sum += item.total_price
    end
    sum
  end

  def self.search(search)
    where('name LIKE ?', "%#{search}%")
  end	
end
