class BookingsController < ApplicationController

  def new
    # authorize @booking
    @experience = Experience.find(params[:experience_id])
    @booking = Booking.new
  end

  def create
    # authorize @booking
    @experience = Experience.find(params[:experience_id])
    @booking  = Booking.new(booking_params)
    @booking.experience = @experience
    @booking.user = current_user
    @booking.status = "Proxima"
    if @booking.save!
      redirect_to user_path(current_user)
    else
      render :new
    end
  end

  def destroy
    # authorize @booking
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to user_path(params[:user_id])
  end

  private

  def booking_params
   params.require(:booking).permit(:date)
  end

end
