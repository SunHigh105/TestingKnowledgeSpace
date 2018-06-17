class UsersController < ApplicationController
  before_action :logged_in_user, only:[:edit, :update, :mypage, :destroy]
  before_action :correct_user, only:[:edit, :update]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "登録が完了しました"
      redirect_to user_url(@user)
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "プロフィールを更新しました"
      redirect_to user_url(@user)
    else
      render 'edit'
    end
  end

  def show
    @user = User.find(params[:id])
    @articles = @user.articles.all
  end

  def delete
    User.find(params[:id]).destroy
    flash[:success] = "ユーザーを削除しました"
    redirect_to users_url
  end

  private

  # ユーザーのパラメータ
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  # ログインしていなければログイン画面にリダイレクト
  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "ログインしてください。"
      redirect_to login_url
    end
  end

  # ログインしているユーザーと違っていたらホーム画面にリダイレクト
  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end

end