class Ecole < ApplicationRecord
  has_many :professeurs, dependent: :destroy
  has_many :interventions
end
