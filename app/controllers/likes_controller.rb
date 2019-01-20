class LikesController < ApplicationController

  def create
    @post = @post.find(paramas[:post_id])
    @like = Like.new(like_params)
    
  end

  def destroy

  end
end
