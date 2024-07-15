class ArticlesController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]
    before_action :set_article, except: [:index, :new, :create]

    def index
        @articles = Article.all
    end

    def show
    
    end

    def new
        @article = Article.new
    end

    def create
        @article = Article.new(article_params)
        if @article.save
            redirect_to @article
        else
            render :new, status: :unprocessable_entity
        end
    end

    def edit
    end

    def update
        if @article.update(article_params)
            redirect_to @article
        else 
            render :edit, status: :unprocessable_entity
        end
    end

    def destory
        @article.destroy
        redirect_to root_path
    end
    
    private

    def article_params
        params.require(:article).permit(:title, :body)
    end

    def set_article
        @article = Article.find(params[:id])
        rescue ActiveRecord::RecordNotFound
            redirect_to root_path
    end
end