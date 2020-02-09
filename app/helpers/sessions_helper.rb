module SessionsHelper

  #既存ユーザチェック（以下コメントアウトのコードと同じ）
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
  
=begin
  if @current_user
    return @current_user
  else
    @current_user = User.find_by(id: session[:user_id])
    return @current_user
=end

  #ログイン中の確認(ログインしていればtrue,　していなければfalseを返す)
  def logged_in?
    !!current_user
  end

=begin
  if current_user
    return true
  else
    return false
=end


end
