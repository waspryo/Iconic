class PostsController < ApplicationController

   def new
       @post = Post.new
   end
 #
  def create
     @post = Post.new(psot_params)
     if @post.save
       flash[:notice] = "投稿できました。"
     redirect_to action: 'show'
      end
   end
 #
 #  def edit
 #    @post = Post.find(params[:id])
 #  end
 #
 #  def update
 #   @post = Post.find(params[:id])
 #   if @post.update(post_params)
 #     redirect_to post_show_path(@post)
 #  else
 #    render :edit
 #  end
 # end
 #
 # def destroy
 # end
 #
 #  def show
 #   @posts = Post.all
 #  end
 def show
   @posts = Post.all
 end

 # def create
 #   @post = Post.new(permit_params)
 #   @post.save!
 #   redirect_to action: 'show'
 # end


  private
    def post_params
    params.require(:post).permit(:title,:content,:image)
    end
end
