class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.alpha_order
   order(:name)
  end
end
