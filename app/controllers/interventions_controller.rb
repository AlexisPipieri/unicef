class InterventionsController < ApplicationController

  def index
    @interventions = Intervention.all
    @open_interventions = Intervention.where.not(statut: 'Terminée').sort_by {|intervention| intervention.date_intervention.to_date}
    @plaideurintervention = PlaideurIntervention.new
    # @pending_interventions = Intervention.where(statut: "A traiter")
    # @active_interventions = Intervention.where(statut: 'En cours')
    @closed_interventions  = Intervention.where(statut: 'Terminée')
    # @unassigned_interventions = Intervention.where(statut: 'Non-assigné')


    # search
    if params[:query] && params[:query] != ''
      matching_interventions = []
      if @interventions.search_interventions(params[:query]).empty?
        plaideurinterventions = PlaideurIntervention.all
        plaideurinterventions = plaideurinterventions.search_plaideur(params[:query])
        plaideurinterventions.each do |plaideurintervention|
          intervention = Intervention.find(plaideurintervention.intervention_id)
          matching_interventions << intervention
        end
      else
        matching_interventions = @interventions.search_interventions(params[:query])
      end
      @open_interventions = matching_interventions.select{|intervention| intervention.statut != 'Terminée'}.sort_by {|intervention| intervention.date_intervention.to_date}
      @closed_interventions = matching_interventions.select{|intervention| intervention.statut == 'Terminée'}.sort_by {|intervention| intervention.date_intervention.to_date}
    end
    # assign
    @users_list = User.all
  end



end
