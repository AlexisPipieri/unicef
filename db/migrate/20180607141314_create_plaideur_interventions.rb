class CreatePlaideurInterventions < ActiveRecord::Migration[5.2]
  def change
    create_table :plaideur_interventions do |t|
      t.references :user, foreign_key: true
      t.references :intervention, foreign_key: true

      t.timestamps
    end
  end
end
