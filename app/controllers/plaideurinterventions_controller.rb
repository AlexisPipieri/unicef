class PlaideurinterventionsController < ApplicationController
  skip_before_action :authenticate_user! #à enlever pour mise en prod


  def create
    intervention = Intervention.find(params[:intervention_id])
    plaideur = User.find(params[:plaideur_intervention][:user_id])
    @plaideurintervention = PlaideurIntervention.new(intervention: intervention, user: plaideur)
    @plaideurintervention.save!
    redirect_to interventions_path
  end

  # on récupère l'user id dans les params, mais pas l'intervention id...

  private

  # def plaideurintervention_params
  #   params.require(:plaideur_intervention).permit(:user_id).permit(:intervention_id)
  # end

end
