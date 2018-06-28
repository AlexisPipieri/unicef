class InterventionsController < ApplicationController
  skip_before_action :authenticate_user! # À enlever pour la mise en prod

  def index
    @interventions = Intervention.all
    @plaideurintervention = PlaideurIntervention.new
    @pending_interventions = Intervention.where(statut: "A traiter")
    @active_interventions = Intervention.where(statut: 'En cours')
    @finished_interventions  = Intervention.where(statut: 'Terminé')
    @unassigned_interventions = Intervention.where(statut: 'Non-assigné')


    # search
    if params[:query] && params[:query] != ''
      if @interventions.search_interventions(params[:query]).empty?
        plaideurinterventions = PlaideurIntervention.all
        matching_interventions = []
        plaideurinterventions = plaideurinterventions.search_plaideur(params[:query])
        plaideurinterventions.each do |plaideurintervention|
          intervention = Intervention.find(plaideurintervention.intervention_id)
          matching_interventions << intervention
        end
        @interventions = matching_interventions
      else
        @interventions = @interventions.search_interventions(params[:query])
      end
    end

    # assign
    @users_list = User.all
  end



end
