class UsersController < ApplicationControllerprivate

  has_many :posts
  
  def show
     @user = User.find(params[:id])
     @tweets = @user.tweets.all
   end

   def edit
     @user = User.find(params[:id])
   end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_show_path(@user)
   else
     render :edit
   end
  end


   private
   def user_params
     params.require(:user).permit(:name, :email,,:password, :password_confirmation, :image, :remember_digest)
   end
