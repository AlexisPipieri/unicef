class InterventionsController < ApplicationController
  before_action :find_intervention, only: [ :update ]

  def index
    @interventions = Intervention.all
    @open_interventions = Intervention.where(statut: 'En cours').sort_by {|intervention| intervention.date_intervention.to_time}
    @unassigned_interventions = Intervention.where(statut: 'Non-assignée').sort_by {|intervention| intervention.date_intervention.to_time}
    @closed_interventions  = Intervention.where(statut: 'Terminée').sort_by {|intervention| intervention.date_intervention.to_time}
    @cancelled_interventions = Intervention.where(statut: 'Annulée').sort_by {|intervention| intervention.date_intervention.to_time}
    @other_interventions = Intervention.where.not(statut: 'En cours').where.not(statut: 'Non-assignée').where.not(statut: 'Terminée').where.not(statut: 'Annulée').sort_by {|intervention| intervention.date_intervention.to_time}

    @plaideurintervention = PlaideurIntervention.new

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
      @open_interventions = matching_interventions.select{|intervention| intervention.statut != 'Terminée' || intervention.statut.nil?}.sort_by {|intervention| intervention.date_intervention.to_time}
      @closed_interventions = matching_interventions.select{|intervention| intervention.statut == 'Terminée'}.sort_by {|intervention| intervention.date_intervention.to_time}
    end
    # assign
    @users_list = User.all

    # update statut
    @statut_list = ["Non-assignée", "En cours", "Terminée", "Annulée"]
  end

  def new
    @intervention = Intervention.new
    @theme_list = Theme.all
  end

  def create
    @intervention = Intervention.new(intervention_params)
    if @intervention.save
      # if user selects a plaideur, then create an instance of plaideurintervention
      unless plaideur_params.empty?
        plaideur_params[:user_ids].each do |plaideur_id|
          plaideur = User.find(plaideur_id)
          @plaideurintervention = PlaideurIntervention.new(intervention: @intervention,
           user: plaideur)
          @plaideurintervention.save
        end
      end
      redirect_to intervention_path(@intervention)
    else
      render :new
    end
  end

  def update
    @intervention.update_attributes(intervention_params)
    if @intervention.save
      redirect_to interventions_path
    end
  end

  private

  def find_intervention
    @intervention = Intervention.find(params[:id])
  end

  def intervention_params
    params.require(:intervention).permit(:date_contact, :date_intervention,
      :theme_id, :ecole_id, :statut)
  end

  def plaideur_params
    params.require(:intervention).permit(:user_ids => [])
  end

end
