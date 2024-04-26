class ArticlesController < ApplicationController
  ##before_action :require_user, only: [:index, :show]
  before_action :require_user, only: [:new, :create]
  before_action :require_owner, only: [:edit, :update, :destroy]

  def index
    @articles = Article.order(:created_at => :desc)
    @article = Article.new
    @pagy, @articles = pagy(@articles, items: 3)
    @tags = Article.tag_counts_on(:tags)
    if params[:tag_name]
      @articles = @articles.tagged_with(params[:tag_name])
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
    @comment = Comment.new(article_id: params[:article_id])
    set_tags
    @article.save
  end

  def create
    @article = Article.new(article_params)
    # @article.tag_list = params[:article][:tag_list].split(',')
    @article.user = current_user

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
      redirect_to root_path, alert: t('articles.messages.not_owner')
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :body, :user_id, :tag_list)
  end

  def set_tags
    tags_data = ["Love ❤️",
                 "Family 👨‍👩‍👧‍👦",
                 "Friends 👫",
                 "Food 🍔",
                 "Travel ✈️",
                 "Photography 📷",
                 "Music 🎵",
                 "Movies 🎬",
                 "Books 📚",
                 "Sports ⚽",
                 "Fitness 💪",
                 "Technology 💻",
                 "Fashion 👗",
                 "Art 🎨",
                 "Nature 🌳",
                 "Animals 🐶",
                 "Games 🎮",
                 "Party 🎉",
    ]
    @tags = tags_data
  end
end