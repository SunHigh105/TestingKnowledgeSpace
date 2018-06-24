class StaticPagesController < ApplicationController
  def home
    puts @latest_articles = Article.order("created_at DESC").find(Array(1..3))
  end
end
