class ExperiencesController < ApplicationController
  before_action :set_experience, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:show]

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
    @user = @experience.user

    # authorize @experience
  end

  def edit
  end

  def update
    if @experience.update(experience_params)
      redirect_to user_path(current_user)
    else
      render 'edit'
    end
  end

  def destroy
    @experience.destroy
    redirect_to user_path(current_user)
  end

  private

  def set_experience
    @experience = Experience.find(params[:id])
  end

  def experience_params
    params.require(:experience).permit(:name, :category, :availability, :description, :price, :place, :photo)
  end
end

