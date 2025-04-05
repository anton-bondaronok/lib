class Admin::AuthorsController < AdminController
  before_action :set_author, only: %i[ show edit update destroy ]

  # GET /admin/authors
  def index
    @authors = if params[:query].present?
      Author.where("full_name ILIKE :q OR short_bio ILIKE :q", q: "%#{params[:query]}%")
    else
      Author.all
    end.order(created_at: :desc).includes(avatar_attachment: :blob)
  end

  # GET /admin/authors/1
  def show
  end

  # GET /admin/authors/new
  def new
    @author = Author.new
  end

  # GET /admin/authors/1/edit
  def edit
  end

  # POST /admin/authors
  def create
    @author = Author.new(author_params)

    if @author.save
      redirect_to [ :admin, @author ], notice: "Author was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /admin/authors/1
  def update
    if @author.update(author_params)
      redirect_to [ :admin, @author ], notice: "Author was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /admin/authors/1
  def destroy
    @author.destroy!
    redirect_to admin_authors_url, notice: "Author was successfully destroyed.", status: :see_other
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_author
      @author = Author.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def author_params
      params.require(:author).permit(:full_name, :short_bio, :avatar)
    end
end
