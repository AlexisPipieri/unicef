class CreateEcoles < ActiveRecord::Migration[5.2]
  def change
    create_table :ecoles do |t|
      t.string :nom
      t.string :adresse
      t.string :responsable
      t.string :email

      t.timestamps
    end
  end
end
