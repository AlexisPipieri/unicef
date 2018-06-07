class Ecole < ApplicationRecord
  has_many :professeurs
  has_many :interventions
end
