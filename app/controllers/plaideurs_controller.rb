class PlaideursController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @plaideurs = User.all
  end
end
