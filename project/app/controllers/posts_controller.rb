class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /posts
  # GET /posts.json
  def index
    if params[:search]
      @posts = Post.searchPost(params[:search]).order("created_at DESC")

      @posts2 = Post.searchPost2(params[:search]).order("created_at DESC")
      @users = User.searchUser(params[:search]).order("created_at DESC")
    else
      @posts = Post.all.order('created_at DESC')
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show

    @post = Post.find(params[:id])
    @comments = Comment.where(post_id: @post.id).order! 'created_at DESC'
  end

  # GET /posts/new
  def new
    @post = Post.new
    @comment = Comment.new(post_id: params[:post_id])
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def upvote
    @post = Post.find(params[:id])
    @vote = Vote.find_by(user_id: current_user.id, post_id: @post.id)
    if @vote != nil
      @vote.destroy
    end
    @post.vote.create(:user_id => current_user.id, :post_id =>@post.id, :vote => true )
    redirect_to(post_url(@post))
  end

  def followpost
    @post = Post.find(params[:id])
    @followed = Follow.find_by(user_id: current_user.id, post_id: @post.id)
    if @followed != nil
      @followed.destroy
    end
    @post.follow.create(:user_id=> current_user.id, :post_id =>@post.id)

  end

  def downvote
    @post = Post.find(params[:id])
    @vote = Vote.find_by(user_id: current_user.id, post_id: @post.id)
    if @vote != nil
      @vote.destroy
    end
    @post.vote.create(:user_id => current_user.id, :post_id =>@post.id, :vote => false )
    redirect_to(post_url(@post))
  end

  def ncomment
    @post = Post.find(params[:id])
    @post.comment.create(:user_id => current_user.id, :post_id=>@post.id, :comment => params[:comment])
    redirect_to(post_url(@post))
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:user_id, :title, :description, :open, :location, :solved, :date, :avatar, :latitude, :longitude)
    end

    #Comments of post
    def post_comments
      Comment.where(post: params[:id])
    end

    #Votes of post
    def post_votes
      Vote.where(post: params[:id])
    end

    #Images of post
    def post_images
      Image.where(post: params[:id])
    end

    #links of post
    def post_links
      Link.where(post: params[:id])
    end
end
