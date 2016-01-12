class ArticlesController < ApplicationController
	def index
		@articles = Article.all #we want to get all the articles, y'all
	end

	def new
		@article = Article.new
	end

	def show
		@article = Article.find(params[:id])
	end

end
