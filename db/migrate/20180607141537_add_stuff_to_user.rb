class AddStuffToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :prenom, :string
    add_column :users, :nom, :string
    add_column :users, :tel, :string
    add_column :users, :admin, :boolean
    add_column :users, :niveau, :string
  end
end
