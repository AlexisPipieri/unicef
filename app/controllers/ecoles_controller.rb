class EcolesController < ApplicationController

  def index
    @ecoles = Ecole.all
    if params[:query] && params[:query] != ''
      @ecoles = @ecoles.search_ecoles(params[:query])
    end
  end

end
