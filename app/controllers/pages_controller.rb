class PagesController < ApplicationController


  def home
  end

  def contact
  end

  def show
      @posts = Post.all
  end

end
