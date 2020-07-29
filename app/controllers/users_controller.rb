class UsersController < ApplicationController
  #skip_before_action :authenticate_user!
  #skip_before_action :verify_authenticity_token

  def show
    @user = User.find(params[:id])
    @bookings = @user.bookings
    @experiences = @user.experiences
		# authorize @user
  end
end
