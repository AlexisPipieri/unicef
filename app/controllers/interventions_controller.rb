class InterventionsController < ApplicationController
  skip_before_action :authenticate_user! # À enlever pour la mise en prod

  def index
    @interventions = Intervention.all
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
  end

  def show
    @intervention = Intervention.find(params[:id])
    @plaideurintervention = PlaideurIntervention.new(intervention: @intervention)
  end



end
