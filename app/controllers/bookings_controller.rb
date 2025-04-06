class BookingsController < ApplicationController
  def create
    @book = Book.find(params[:book_id])
    @booking = current_user.bookings.build(book: @book)
    @booking.status = :pending

    if @booking.save
      redirect_to @book, notice: "Booking request sent!"
    else
      redirect_to @book, alert: @booking.errors.full_messages.to_sentence
    end
  end

  def update
    @booking = Booking.find(params[:id])
    status = params[:status]

    if Booking.statuses.keys.include?(status) && @booking.update(status: status)
      redirect_to admin_bookings_path, notice: "Booking marked as #{status}"
    else
      redirect_to admin_bookings_path, alert: "Invalid status"
    end
  end
end
