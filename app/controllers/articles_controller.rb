class ArticlesController < ApplicationController
  # set article variable
  before_action :set_article, only: %i[show edit update destroy]

  def show; end

  def index
    @articles = Article.paginate(page: params[:page], per_page: 5)
  end

  def new
    @article = Article.new
  end

  def edit; end

  def create
    # save form inputs to database (whitelist data using .permit())
    @article = Article.new(article_params)
    @article.user = User.first

    # if save is successful, redirect to articles/<id>. if not, display errors
    if @article.save
      flash[:notice] = 'Article was created successfully.'
      redirect_to @article
    else
      render 'new'
    end
  end

  def update
    # save updated article to database and redirect if successful. else, display errors
    if @article.update(article_params)
      flash[:notice] = 'Article was updated successfully.'
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_path # redirect to /articles
  end

  # private methods
  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :description)
  end
end
