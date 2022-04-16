class Discount < ApplicationRecord
  validates_presence_of :discount_percentage, :quantity_threshold
  belongs_to :merchant
end
