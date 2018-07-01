class StaticPagesController < ApplicationController
  def home
    @latest_articles = Article.order("created_at DESC")
  end
end
