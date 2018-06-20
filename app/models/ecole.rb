class Ecole < ApplicationRecord
  has_many :professeurs, dependent: :destroy
  has_many :interventions, dependent: :destroy

  def to_label
    # method to display the name in simple form association when creating an intervention
    "#{nom}"
  end
end
