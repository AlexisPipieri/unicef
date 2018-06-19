class PlaideurinterventionsController < ApplicationController
  skip_before_action :authenticate_user! #à enlever pour mise en prod


  # Il faudrait créer la plaideurintervention en même temps qu'on crée l'intervention pour pouvoir l'éditer ensuite

end
