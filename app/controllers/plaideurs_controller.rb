class PlaideursController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index] # À enlever pour la mise en prod

  def index
    if params[:query].present?
      @plaideurs = User.search_by_prenom_nom(params[:query])
    else
      @plaideurs = User.all
    end
  end
end
