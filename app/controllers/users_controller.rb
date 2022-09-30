class UsersController < ApplicationController
  before_action :require_logged_in, only: [:show]
  def show
    @user = User.find_by(id: session[:user_id])
    if !@user
      return redirect_to login_path
    end
    @books = current_user.books.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = '登録しました'
      redirect_to root_path
    else
      flash[:danger] = '登録できませんでした'
      render :new
    end
  end

  private
  def user_params 
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
