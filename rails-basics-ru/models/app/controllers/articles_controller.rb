# frozen_string_literal: true

class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    if params[:id].present?
      @article = Article.find(params[:id])
    else
      @article = Article.first
    end
  end
end
