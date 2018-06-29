class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :theme, optional: true
  has_many :plaideur_interventions, dependent: :destroy
  has_many :interventions, through: :plaideur_interventions

  def to_label
    # method to display the name in simple form association when creating an intervention
    "#{prenom} #{nom}"
  end

  def nom_complet
    "#{prenom} #{nom}"
  end

  include PgSearch
  pg_search_scope :search_by_prenom_nom,
  against: [ :prenom, :nom ],
  using: {
  tsearch: { prefix: true }
  }

end
