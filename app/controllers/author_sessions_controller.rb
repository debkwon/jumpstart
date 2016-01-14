class AuthorSessionsController < ApplicationController
	before_filter :require_login, except: [:new, :create]
  before_filter :require_login, only: [:destroy]
	def new #contains login form and passes fields to create
 	end

  def create
    if login(params[:email], params[:password]) #checks email and pw parameters passed in
      redirect_back_or_to(articles_path, notice: 'Logged in successfully.')#redirect to articles_path, which is the articles_index page and gives a success notice
    else
      flash.now.alert = "Login failed." #notice of failure
      render action: :new #generates a new login form
    end
  end

  def destroy
    logout
    redirect_to(:authors, notice: 'Logged out!')
  end
end
