class AddDefaultValueToInterventionStatut < ActiveRecord::Migration[5.2]
  def change
    change_column :interventions, :statut, :string, :default => "Non-assignée"
  end
end
