class EcolesController < ApplicationController

  def index
    @ecoles = Ecole.all
  end

end
