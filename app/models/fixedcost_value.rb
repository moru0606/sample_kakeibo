class FixedcostValue < ApplicationRecord
  has_many :fixedcost_values, dependent: :destroy
end
