class CreateInterventions < ActiveRecord::Migration[5.2]
  def change
    create_table :interventions do |t|
      t.string :date_contact
      t.string :date_intervention
      t.string :statut
      t.references :theme, foreign_key: true
      t.references :ecole, foreign_key: true

      t.timestamps
    end
  end
end
