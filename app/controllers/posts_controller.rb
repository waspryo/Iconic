class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show]
  before_action :is_authorised, only: [:show]




  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all
    # @posts = current_user.posts

  end

  # GET /posts/1
  # GET /posts/1.json
  def show
     @post = Post.find(params[:id])

  end

  # GET /posts/new
  def new
    @post = Post.new

  end

  # GET /posts/1/edit
  def edit
    if @post.user_id != current_user.id
      redirect_to posts_path, alert: "You don't have permission"
    end
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id

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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    def is_authorised
      redirect_to posts_path, alert: "You don't have permission" unless current_user.id == @post.user_id
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :name, :age, :occupation, :fullname, :アウター, :トップス, :ボトムス, :バッグ, :アクセサリー, :comment, :image, :location, :latitude, :longitude, :content, :user_id)
    end
end
