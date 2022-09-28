class Product < ApplicationRecord
  validates :sku, presence: true, uniqueness: true
end
