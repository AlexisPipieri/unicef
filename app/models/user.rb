class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :theme, optional: true
  has_many :plaideur_interventions, dependent: :destroy

  include PgSearch
  multisearchable against: [ :prenom, :nom, :niveau, :email]
end
