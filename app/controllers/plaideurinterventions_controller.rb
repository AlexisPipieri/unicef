class PlaideurinterventionsController < ApplicationController


  def create
    @plaideurintervention = PlaideurIntervention.new(plaideurintervention_params)
    if @plaideurintervention.save
      intervention = Intervention.find(plaideurintervention_params[:intervention_id])
      if intervention.statut == "Non-assignée"
        intervention.statut = "En cours"
        intervention.save
      end
    end
    redirect_to interventions_path
  end

  def destroy
    @plaideurintervention = PlaideurIntervention.find(params[:id])
    intervention = Intervention.find(@plaideurintervention.intervention_id)
    @plaideurintervention.destroy!
    if intervention.users.empty? && intervention.statut == "En cours"
      intervention.statut = "Non-assignée"
      intervention.save
    end
    redirect_to interventions_path
  end

  private

  def plaideurintervention_params
    params.require(:plaideur_intervention).permit(:user_id, :intervention_id)

  end

end
