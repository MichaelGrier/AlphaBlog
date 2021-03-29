class ArticlesController < ApplicationController
  def show
    @article = Article.find(params[:id])
  end

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    # save form inputs to database (whitelist data using .permit())
    @article = Article.new(params.require(:article).permit(:title, :description))

    # if save is successful, redirect to articles/<id>. if not, display errors
    if @article.save
      flash[:notice] = 'Article was created successfully.'
      redirect_to @article
    else
      render 'new'
    end
  end

  def update
    # save updated article to database and redirect if successful. else, render errors.
    @article = Article.find(params[:id])
    if @article.update(params.require(:article).permit(:title, :description))
      flash[:notice] = 'Article was updated successfully.'
      redirect_to @article
    else
      render 'edit'
    end
  end
end
