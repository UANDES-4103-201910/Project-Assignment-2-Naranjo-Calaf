class InnapropiatesController < ApplicationController
  before_action :set_innapropiate, only: [:show, :edit, :update, :destroy]

  # GET /innapropiates
  # GET /innapropiates.json
  def index
    @innapropiates = Innapropiate.all.order! 'created_at DESC'
    # @posts = Post.where(ids: @innapropiates).order! 'created_at DESC'
    # @comments = Comment.where(post: @posts.ids).order! 'created_at DESC'
  end

  # GET /innapropiates/1
  # GET /innapropiates/1.json
  def show
  end

  # GET /innapropiates/new
  def new
    @innapropiate = Innapropiate.new
  end

  # GET /innapropiates/1/edit
  def edit
  end

  # POST /innapropiates
  # POST /innapropiates.json
  def create
    @innapropiate = Innapropiate.new(innapropiate_params)

    respond_to do |format|
      if @innapropiate.save
        format.html { redirect_to @innapropiate, notice: 'Innapropiate was successfully created.' }
        format.json { render :show, status: :created, location: @innapropiate }
      else
        format.html { render :new }
        format.json { render json: @innapropiate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /innapropiates/1
  # PATCH/PUT /innapropiates/1.json
  def update
    respond_to do |format|
      if @innapropiate.update(innapropiate_params)
        format.html { redirect_to @innapropiate, notice: 'Innapropiate was successfully updated.' }
        format.json { render :show, status: :ok, location: @innapropiate }
      else
        format.html { render :edit }
        format.json { render json: @innapropiate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /innapropiates/1
  # DELETE /innapropiates/1.json
  def destroy
    @innapropiate.destroy
    respond_to do |format|
      format.html { redirect_to innapropiates_url, notice: 'Innapropiate was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_innapropiate
      @innapropiate = Innapropiate.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def innapropiate_params
      params.require(:innapropiate).permit(:user_id, :post_id, :coment)
    end
end
