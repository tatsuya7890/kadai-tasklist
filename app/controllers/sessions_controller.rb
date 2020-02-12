class SessionsController < ApplicationController

  def create
    email = params[:session][:email].downcase
    password = params[:session][:password]

    #ログイン判定( private参照)
    if login(email, password)
      flash[:success] = 'ログインに成功しました'
      redirect_to root_url
    else
      flash.now[:danger] = 'ログインできませんでした'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:sucess] = 'ログアウトしました'
    redirect_to root_url
  end
  
  private
  
  #ログイン処理
  def login(email, password)
    @user = User.find_by(email: email)
    if @user && @user.authenticate(password)
      #ログイン成功
      session[:user_id] = @user.id
      return true

    else
      #ログイン失敗
      return false
    end
  end
end
