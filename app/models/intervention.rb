class Intervention < ApplicationRecord
  belongs_to :theme
  belongs_to :ecole
  has_many :plaideur_interventions, dependent: :destroy

  include PgSearch
  multisearchable against: [ :statut, :date_intervention, :date_contact ]
end
