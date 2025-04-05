class Admin::TagsController < AdminController
  before_action :set_tag, only: %i[ show edit update destroy ]

  # GET /admin/tags
  def index
    @tags = if params[:query].present?
      Tag.where("name ILIKE :q", q: "%#{params[:query]}%")
    else
      Tag.all
    end.order(created_at: :desc)
  end

  # GET /admin/tags/1
  def show
  end

  # GET /admin/tags/new
  def new
    @tag = Tag.new
  end

  # GET /admin/tags/1/edit
  def edit
  end

  # POST /admin/tags
  def create
    @tag = Tag.new(tag_params)

    if @tag.save
      redirect_to [ :admin, @tag ], notice: "Tag was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /admin/tags/1
  def update
    if @tag.update(tag_params)
      redirect_to [ :admin, @tag ], notice: "Tag was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /admin/tags/1
  def destroy
    @tag.destroy!
    redirect_to admin_tags_url, notice: "Tag was successfully destroyed.", status: :see_other
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tag
      @tag = Tag.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tag_params
      params.require(:tag).permit(:name)
    end
end
