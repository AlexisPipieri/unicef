class Theme < ApplicationRecord
  has_many :interventions
  has_many :users
end
