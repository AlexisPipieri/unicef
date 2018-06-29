class InterventionsController < ApplicationController

  def index
    @interventions = Intervention.all
    @open_interventions = Intervention.where.not(statut: 'Terminée').sort_by {|intervention| intervention.date_intervention.to_time}
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
      @open_interventions = matching_interventions.select{|intervention| intervention.statut != 'Terminée' || intervention.statut.nil?}.sort_by {|intervention| intervention.date_intervention.to_time}
      @closed_interventions = matching_interventions.select{|intervention| intervention.statut == 'Terminée'}.sort_by {|intervention| intervention.date_intervention.to_time}
    end
    # assign
    @users_list = User.all
  end

  def show
    @intervention = Intervention.find(params[:id])
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

  private

  def intervention_params
    params.require(:intervention).permit(:date_contact, :date_intervention,
      :theme_id, :ecole_id)
  end

  def plaideur_params
    params.require(:intervention).permit(:user_ids => [])
  end

end
