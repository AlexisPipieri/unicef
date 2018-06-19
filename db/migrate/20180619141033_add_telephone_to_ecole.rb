class AddTelephoneToEcole < ActiveRecord::Migration[5.2]
  def change
    add_column :ecoles, :telephone, :string
  end
end
