class ApplicationController < ActionController::Base
  
  #Controller から Helper のメソッドを使うため
  include SessionsHelper
  
  
  private
  
    #ログイン中かチェック。していない場合は、ログインページへ移動
    def require_user_logged_in
      unless logged_in?
        redirect_to login_url
      end
    end
    
end
