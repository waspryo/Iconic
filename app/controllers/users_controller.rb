class UsersController < ApplicationController



  def show
     @user = User.find(params[:id])
   end

   def index
   @users = User.all
 end


   # def create
   #   if user = User.authenticate(email: params[:email], password: params[:password])
   #     session[:user_id] = user.id
   #     redirect_to("/posts/index")
   #   else
   #     flash[:notice] = "ログインに失敗しました"
   # end
  #  def login
  #   @user = User.find_by(email: params[:email], password: params[:password])
  #   if @user
  #     session[:user_id] = @user.id
  #
  #     flash[:notice] = "ログインしました"
  #     redirect_to("/posts/index")
  #   else
  #     @email = params[:email]
  #     @password = params[:password]
  #     render("users/login_form")
  #   end
  # end
  #
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
     params.require(:user).permit(:name, :email,:password, :password_confirmation, :image, :fullname, :remember_digest)
   end
end
