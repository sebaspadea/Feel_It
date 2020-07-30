class PagesController < ApplicationController
  skip_before_action :authenticate_user!
  skip_before_action :verify_authenticity_token
  after_action :skip_pundit?

  def home
  # aca voy a mostrar las cards
    @experiences = Experience.all

    @experiences = Experience.geocoded # returns experience with coordinates

    @markers = @experiences.map do |experience|
      {
        lat: experience.latitude,
        lng: experience.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { experience: experience })
      }
    end
  end
end
