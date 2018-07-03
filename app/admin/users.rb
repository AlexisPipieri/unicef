ActiveAdmin.register User do

  index do
    selectable_column
    column :id
    column :admin
    column :nom
    column :prenom
    column :email
    column :tel
    column :niveau
    column :theme
    column "Créé le", :created_at
    column "Dernière connexion", :last_sign_in_at
    actions
  end


  permit_params :nom, :prenom, :email, :tel, :niveau, :theme_id, :admin
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

end
