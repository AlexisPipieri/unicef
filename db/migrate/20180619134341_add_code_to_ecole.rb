class AddCodeToEcole < ActiveRecord::Migration[5.2]
  def change
    add_column :ecoles, :code, :string
  end
end
