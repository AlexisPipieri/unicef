class CreateProfesseurs < ActiveRecord::Migration[5.2]
  def change
    create_table :professeurs do |t|
      t.string :nom
      t.string :prenom
      t.references :ecole, foreign_key: true

      t.timestamps
    end
  end
end
