class StaticPagesController < ApplicationController
  def home
    @latest_articles = Article.order(:created_at).last(3)
    @categories = Category.all
  end
end
