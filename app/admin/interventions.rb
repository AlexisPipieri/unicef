ActiveAdmin.register Intervention do

  index do
    selectable_column
    column :date_contact
    column :date_intervention
    column "École" do |intervention|
      "#{intervention.ecole.code} - #{intervention.ecole.nom}"
    end
    column "Thème" do |intervention|
      intervention.theme.nom
    end
    column "Plaideurs" do |intervention|
      intervention.users
    end
    actions
  end

  show do
    attributes_table do
      row :date_contact
      row :date_intervention
      row "École" do |intervention|
        link_to("#{intervention.ecole.code} - #{intervention.ecole.nom}", admin_ecole_path(intervention.ecole))

      end
      row "Thème" do |intervention|
        intervention.theme.nom
      end
      row "Plaideurs" do |intervention|
        intervention.users
      end
    end
    active_admin_comments
  end

  permit_params :date_contact, :date_intervention, :theme_id, :ecole_id
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



    # panel "Plaideurs" do
    #   table_for intervention.plaideur_interventions do
    #     column "name" do |plaideur_intervention|
    #       plaideur_intervention.user.nom
    #     end
    #     column :nom
    #   end
    # end
