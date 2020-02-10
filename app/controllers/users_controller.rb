class UsersController < ApplicationController

  #事前処理（ログインしているか確認）
  before_action :require_user_logged_in, only: [:show]

  def index
    #@users = User.order(id: :desc).page(params[:page]).per(20)
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      flash[:success] = 'アカウントの登録をしました'
      redirect_to login_path
    else
      flash[:danger] = 'アカウントの登録に失敗しました'
      render :new
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  
end
