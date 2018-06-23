class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :theme, optional: true
  has_many :plaideur_interventions, dependent: :destroy

  include PgSearch
  pg_search_scope :search_by_prenom_nom,
  against: [ :prenom, :nom ],
  using: {
  tsearch: { prefix: true } 
  }

end
