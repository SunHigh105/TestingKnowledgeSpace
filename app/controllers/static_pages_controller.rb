class StaticPagesController < ApplicationController
  def home
    @latest_articles = Article.order("created_at DESC")
    @categories = Category.all
  end
end
