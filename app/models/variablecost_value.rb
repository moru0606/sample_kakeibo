class VariablecostValue < ApplicationRecord
  has_many :variablecost_values, depentent: :destroy
end
