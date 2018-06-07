class Intervention < ApplicationRecord
  belongs_to :theme
  belongs_to :ecole
  has_many :plaideur_interventions
end
