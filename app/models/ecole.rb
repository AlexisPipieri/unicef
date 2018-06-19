class Ecole < ApplicationRecord
  has_many :professeurs, dependent: :destroy
  has_many :interventions

  include PgSearch
  pg_search_scope :search_ecoles,
    against: [ :nom, :adresse, :code],
    using: {
      tsearch: { prefix: true }
    }
end
