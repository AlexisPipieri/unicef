class InterventionsController < ApplicationController
  skip_before_action :authenticate_user! # À enlever pour la mise en prod
  def index
    @interventions = Intervention.all
    plaideurinterventions = PlaideurIntervention.all
    # raise
    if params[:query] && params[:query] != ''
      if @interventions.search_interventions(params[:query]).empty?
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

    # mettre un scope de pgsearch dans plaideurintervention. Si le premier scope ne renvoie rien, alors chercher avec le deuxième scope
  end

end
