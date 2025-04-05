class Admin::GenresController < AdminController
  before_action :set_genre, only: %i[ show edit update destroy ]

  # GET /admin/genres or /admin/genres.json
  def index
    @genres = if params[:query].present?
      Genre.where("name ILIKE :q", q: "%#{params[:query]}%")
    else
      Genre.all
    end.order(created_at: :desc)
  end

  # GET /admin/genres/1 or /admin/genres/1.json
  def show
  end

  # GET /admin/genres/new
  def new
    @genre = Genre.new
  end

  # GET /admin/genres/1/edit
  def edit
  end

  # POST /admin/genres or /admin/genres.json
  def create
    @genre = Genre.new(admin_genre_params)

    if @genre.save
      redirect_to [ :admin, @genre ], notice: "Genre was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /admin/genres/1 or /admin/genres/1.json
  def update
    if @genre.update(admin_genre_params)
      redirect_to [ :admin, @genre ], notice: "Genre was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /admin/genres/1 or /admin/genres/1.json
  def destroy
    @genre.destroy!

    redirect_to admin_genres_path, status: :see_other, notice: "Genre was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_genre
      @genre = Genre.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def admin_genre_params
      params.require(:genre).permit(:name)
    end
end
