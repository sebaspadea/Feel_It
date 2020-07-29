class PagesController < ApplicationController
  skip_before_action :authenticate_user!
  skip_before_action :verify_authenticity_token
  after_action :skip_pundit?

  def home
    #aca voy a mostrar las cards
  @experiences = Experience.all
  end
end
