class Ecole < ApplicationRecord
  has_many :professeurs, dependent: :destroy
  has_many :interventions, dependent: :destroy

  include PgSearch
  pg_search_scope :search_ecoles,
    against: [ :nom, :adresse, :code],
    using: {
      tsearch: { prefix: true }
    }
end
