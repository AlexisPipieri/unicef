class PlaideurIntervention < ApplicationRecord
  belongs_to :user
  belongs_to :intervention
  validates :user, uniqueness: { scope: :intervention }

  include PgSearch
  pg_search_scope :search_plaideur,
    against: [ :id],
    associated_against: {
      user: [:nom, :prenom]
    },
    using: {
      tsearch: { prefix: true }
    }
end
