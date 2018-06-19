class PlaideurinterventionsController < ApplicationController
  skip_before_action :authenticate_user! #à enlever pour mise en prod


  def create
    raise
    @plaideurintervention = PlaideurIntervention.new(plaideurintervention_params)
    # # we need `restaurant_id` to asssociate review with corresponding restaurant
    # @plaideurintervention.intervention = Intervention.find(params[:intervention_id])
    # @plaideurintervention.save
  end

  # on récupère l'user id dans les params, mais pas l'intervention id...

  private

  def plaideurintervention_params
    params.require(:plaideur_intervention).permit(:user_id)
  end

end
