class Intervention < ApplicationRecord
  belongs_to :theme
  belongs_to :ecole
  has_many :plaideur_interventions, dependent: :destroy
  has_many :users, through: :plaideur_interventions

  include PgSearch
  pg_search_scope :search_interventions,
    against: [ :date_contact, :date_intervention, :statut],
    associated_against: {
      ecole: [ :nom, :adresse, :responsable, :email],
      theme: [:nom]
    },
    using: {
      tsearch: { prefix: true }
    }


end
