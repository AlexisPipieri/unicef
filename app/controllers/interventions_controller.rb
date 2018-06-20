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
      unless params[:intervention][:user_ids].empty?
        plaideur = User.find(params[:intervention][:user_ids])
        @plaideurintervention = PlaideurIntervention.new(intervention: @intervention,
         user: plaideur)
        @plaideurintervention.save
      end
      redirect_to intervention_path(@intervention)
    else
      render :new
    end
  end

  def plaideurs
    # code to have access to plaideurs of an intervention
  end

  private

  def intervention_params
    params.require(:intervention).permit(:date_contact, :date_intervention,
      :theme_id, :ecole_id)
  end

end
