class PlaideurinterventionsController < ApplicationController
  skip_before_action :authenticate_user! #à enlever pour mise en prod


  def create
    @plaideurintervention = PlaideurIntervention.new(plaideurintervention_params)
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

  def plaideurintervention_params
    params.require(:plaideur_intervention).permit(:user_id, :intervention_id)

  end

end
