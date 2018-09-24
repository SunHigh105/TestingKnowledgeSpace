class StaticPagesController < ApplicationController
  def home
    @latest_articles = Article.order("created_at DESC").first(3)
    @categories = Category.all
  end
end
