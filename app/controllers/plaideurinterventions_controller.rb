class PlaideurinterventionsController < ApplicationController
  skip_before_action :authenticate_user! #à enlever pour mise en prod


  def create
    intervention = Intervention.find(params[:plaideur_intervention][:intervention_id])
    plaideur = User.find(params[:plaideur_intervention][:user_id])
    @plaideurintervention = PlaideurIntervention.new(intervention: intervention, user: plaideur)
    if @plaideurintervention.save
      redirect_to interventions_path
    else
      redirect_to interventions_path
    end
  end

  def destroy
    @plaideurintervention = PlaideurIntervention.find(params[:id].to_i)
    @plaideurintervention.destroy!
    redirect_to interventions_path
  end

  private

  # def plaideurintervention_params
  #   params.require(:plaideur_intervention).permit(:user_id).permit(:intervention_id)
  # end

end
