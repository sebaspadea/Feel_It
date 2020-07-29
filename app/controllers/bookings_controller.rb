class BookingsController < ApplicationController

  def create
    # authorize @booking
    @user = User.find(params[:user_id])
    @booking  = Booking.new(booking_params)
    @booking.user = @user
    if @booking.save
      redirect_to user_path(@booking.user)
    else
      render :new
    end
  end

  def new
    # authorize @booking
    @user = User.find(params[:user_id])
    @booking = Booking.new
  end

  def destroy
    # authorize @booking
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to user_path(params[:user_id])
  end

  private

  def booking_params
   params.require(:booking).permit(:date, :experience_id, :user_id)
  end

end
