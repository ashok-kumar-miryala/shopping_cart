class Product < ApplicationRecord

  has_many :items, dependent: :destroy
  has_many :orders, through: :items

  def self.search(search)
    where('name LIKE ?', "%#{search}%")
  end
end
