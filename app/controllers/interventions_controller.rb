class InterventionsController < ApplicationController
  skip_before_action :authenticate_user! # À enlever pour la mise en prod
  def index
    @interventions = Intervention.all
    # raise
    if params[:query] && params[:query] != ''
      @interventions = @interventions.search_interventions(params[:query])
    end
  end

end
