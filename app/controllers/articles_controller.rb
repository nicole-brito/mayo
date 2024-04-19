class ArticlesController < ApplicationController
  ##before_action :require_user, only: [:index, :show]
  before_action :require_user, only: [:new, :create]
  before_action :require_owner, only: [:edit, :update, :destroy]

  def index
    @articles = Article.order(:created_at => :desc)
    @pagy, @articles = pagy(Article.all, items: 3)
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = current_user.articles.create(article_params)

    if @article.save
      redirect_to @article
    else
      render :new
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render :edit
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to root_path
  end

  def require_owner
    @article = Article.find(params[:id])
    unless @article.user == current_user
      redirect_to root_path, alert: "You can only edit or delete your own articles."
    end
  end
  
  private
    def article_params
      params.require(:article).permit(:title, :body)
    end
end
