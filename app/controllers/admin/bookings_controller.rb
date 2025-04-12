class Admin::BookingsController < AdminController
  before_action :set_booking, except: %i[ index ]

  # GET /admin/bookings
  def index
    @bookings = if params[:query].present?
      Booking.joins(:user, :book).where(
        "books.name ILIKE :q OR users.full_name ILIKE :q OR users.email ILIKE :q OR bookings.status ILIKE :q",
        q: "%#{params[:query]}%"
      )
    else
      Booking.all
    end.includes(:user, :book).order(created_at: :desc).load
  end

  # GET /admin/bookings/1
  def show
  end

  def approve
    if @booking.pending? && @booking.update(status: "approved")
      redirect_to admin_booking_path(@booking), notice: "Бронирование подтверждено."
    else
      redirect_to admin_booking_path(@booking), alert: "Бронирование не может быть подтверждено."
    end
  end

  def take
    if @booking.approved? && @booking.update(status: "taken")
      redirect_to admin_booking_path(@booking), notice: "Книга выдана."
    else
      redirect_to admin_booking_path(@booking), alert: "Книга не может быть выдана."
    end
  end

  def reject
    if (@booking.pending? || @booking.rejected?) && @booking.update(status: "rejected")
      redirect_to admin_booking_path(@booking), notice: "Бронирование отклонено."
    else
      redirect_to admin_booking_path(@booking), alert: "Бронирование не может быть отклонено."
    end
  end

  def return
    if @booking.taken? && @booking.update(status: "returned")
      redirect_to admin_booking_path(@booking), notice: "Книга возвращена."
    else
      redirect_to admin_booking_path(@booking), alert: "Бронирование не может быть возвращена."
    end
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end
end
