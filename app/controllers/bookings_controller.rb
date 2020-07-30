class BookingsController < ApplicationController

  def index
    @bookings = current_user.bookings
  end

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
    @booking.status =
    if @booking.save!
      redirect_to user_path(current_user)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @booking.update(booking_params)
      redirect_to user_path(current_user)
    else
      render 'edit'
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
   params.require(:booking).permit(:date, :status)
  end

end
