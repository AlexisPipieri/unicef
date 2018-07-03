class AddStuffToEcoles < ActiveRecord::Migration[5.2]
  def change
    add_column :ecoles, :type, :string
    add_column :ecoles, :enseignants, :string, array: true, default: []
  end
end
