class InterventionsController < ApplicationController
  skip_before_action :authenticate_user! # À enlever pour la mise en prod
  def index
    @interventions = Intervention.all
    # raise
  end

end
