class RatingsController < ApplicationController
  def create
    @rating = current_user.ratings.find_or_initialize_by(book_id: params[:book_id])
    @rating.assign_attributes(rating_params)

    if @rating.save
      redirect_to book_path(@rating.book), notice: "Thank you for rating!"
    else
      redirect_to book_path(@rating.book), alert: "Rating failed."
    end
  end

  def update
    @rating = current_user.ratings.find(params[:id])
    @rating.assign_attributes(rating_params)

    if @rating.save
      redirect_to book_path(@rating.book), notice: "Thank you for rating!"
    else
      redirect_to book_path(@rating.book), alert: "Rating failed."
    end
  end

  private

  def rating_params
    params.require(:rating).permit(:value)
  end
end
