class Api::V1::EcolesController < Api::V1::BaseController
  def show
    @ecole = Ecole.find(params[:id])
    # authorize @ecole
  end
end
