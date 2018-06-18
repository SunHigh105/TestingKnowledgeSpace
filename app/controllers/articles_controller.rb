class ArticlesController < ApplicationController
  before_action :set_target_article, only:[:show, :edit, :update, :destroy]
  before_action :logged_in_user, only: [:create, :destroy]

  def index
    @articles = Article.all
  end

  def show
    
  end

  def new
    @article = Article.new
  end

  def create
    @article = current_user.articles.build(article_params)
    if @article.save
      flash[:success] = "登録が完了しました"
      redirect_to article_url(@article)
    else
      render 'new'
    end
  end

  def edit

  end

  def update
    @article.update(article_params)
    if @article.save
      flash[:success] = "投稿を更新しました"
      redirect_to article_url(@article)
    else
      render 'edit'
    end
  end

  def destroy
    @article.delete
    flash[:notice] = "投稿を削除しました"
    redirect_to articles_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :content)
  end

  def set_target_article
    @article = Article.find(params[:id])
  end

end
