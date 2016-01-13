class ArticlesController < ApplicationController
	include ArticlesHelper

	def index #this is our index action which will display all articles. the view for this page will have links to corresponding articles, which will be shown via the show path
		@articles = Article.all #we want to get all the articles, y'all
	end

	def show #this show action is going to display the current article selected
		@article = Article.find(params[:id])
	end

	def new #sends data to create action
		@article = Article.new #have the new method create a new blank object of the Article class
	end

	def create #creates a new article instance, saves it, then displays the newly created article
		@article = Article.new(article_params)
		@article.save
		flash.notice = "Article '#{@article.title}'' was Added!"
		redirect_to article_path(@article)
	end

	def edit #sends data to update action
		@article = Article.find(params[:id])
	end

	def update #since we're updating an existing article, we need to first find it, use the update method on it and pass in the strong params, then redirect to the page that has the newly edited article (show path).
		@article = Article.find(params[:id])
		@article.update(article_params) #update method automatically saves!
		flash.notice = "Article '#{@article.title}' Updated!"
		redirect_to article_path(@article)
	end

	def destroy
		@article = Article.find(params[:id])
		flash.notice = "Article '#{@article.title}' Deleted."
		@article.destroy
		redirect_to articles_path
	end

end
