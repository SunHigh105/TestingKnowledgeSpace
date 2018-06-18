class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  private
  # ログインしていなければログイン画面にリダイレクト
  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "ログインしてください。"
      redirect_to login_url
    end
  end

   # ユーザーのパラメータ
   def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  # ログインしているユーザーと違っていたらホーム画面にリダイレクト
  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end
end
