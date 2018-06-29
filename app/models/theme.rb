class Theme < ApplicationRecord
  has_many :interventions
  has_many :users

  def to_label
    # method to display the name in simple form association when creating an intervention
    "#{nom}"
  end
end
