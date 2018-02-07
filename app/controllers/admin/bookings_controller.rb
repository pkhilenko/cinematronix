module Admin
  class BookingsController < AdminController
    before_action :load_model, only: %i[show edit update destroy]

    def new
      @booking = Booking.new(movie_session_id: params[:movie_session_id])
    end

    def create
      @booking = Booking.new(booking_params)
      @booking.seat = params[:row].strip + ':' + params[:char].strip
      if @booking.save
        redirect_to @booking
      else
        render :edit
      end
    end

    def show
    end

    private

    def booking_params
      params.require(:booking).permit(:name, :email, :phone, :seat, :movie_session_id)
    end

    def load_model
      @booking = Booking.find(params[:id])
    end
  end
end
