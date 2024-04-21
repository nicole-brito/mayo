class ArticlesController < ApplicationController
  ##before_action :require_user, only: [:index, :show]
  before_action :require_user, only: [:new, :create]
  before_action :require_owner, only: [:edit, :update, :destroy]

  def index
    @articles = Article.order(:created_at => :desc)
    @pagy, @articles = pagy(@articles, items: 3)
    set_tags
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
    set_tags
    @article.save
  end

  def create
    @article = Article.new(article_params)
    @article.tag_list = params[:article][:tag_list].split(',')
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
    params.require(:article).permit(:title, :body, :user_id, :tag_list => [])
  end

  def set_tags
    tags_data = [{ "value": "Love", "code": "❤️" },
                 { "value": "Family", "code": "👨‍👩‍👧‍👦" },
                 { "value": "Friends", "code": "👫" },
                 { "value": "Food", "code": "🍔" },
                 { "value": "Travel", "code": "✈️" },
                 { "value": "Photography", "code": "📷" },
                 { "value": "Music", "code": "🎵" },
                 { "value": "Movies", "code": "🎬" },
                 { "value": "Books", "code": "📚" },
                 { "value": "Sports", "code": "⚽" },
                 { "value": "Fitness", "code": "💪" },
                 { "value": "Technology", "code": "💻" },
                 { "value": "Fashion", "code": "👗" },
                 { "value": "Art", "code": "🎨" },
                 { "value": "Nature", "code": "🌳" },
                 { "value": "Animals", "code": "🐶" },
                 { "value": "Games", "code": "🎮" },
                 { "value": "Party", "code": "🎉" },
                 { "value": "Work", "code": "💼" },
                 { "value": "Studies", "code": "🎓" },
                 { "value": "Health", "code": "🍎" },
                 { "value": "Politics", "code": "🗳️" },
                 { "value": "Science", "code": "🔬" },
                 { "value": "Space", "code": "🚀" },
                 { "value": "History", "code": "🏺" },
                 { "value": "Culture", "code": "🌎" },
                 { "value": "Humor", "code": "😂" },
                 { "value": "Inspiration", "code": "💡" },
                 { "value": "DIY", "code": "🔨" },
                 { "value": "Beauty", "code": "💄" }
    ]
    @tags = tags_data.map { |tag| "#{tag[:value]} #{tag[:code]}" }
  end
end
