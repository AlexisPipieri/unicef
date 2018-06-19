class PlaideurIntervention < ApplicationRecord
  belongs_to :user
  belongs_to :intervention

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
