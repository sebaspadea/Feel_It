class ExperiencesController < ApplicationController
  def index
    # @experiences = policy_scope(Experience)
    @experiences = Experience.all
  end

  def new
    @experience = Experience.new
    # authorize @experience
  end

  def create
    @experience = Experience.new(experience_params)
    @experience.user = current_user
    if @experience.save
      redirect_to root_path
    else
      render 'new'
    end
    # authorize @experience
  end

  def show
    @experience = Experience.find(params[:id])
    # authorize @experience
  end

  private

  def experience_params
    params.require(:experience).permit(:name, :category, :availability, :description, :price, :place, :photo)
  end
end

