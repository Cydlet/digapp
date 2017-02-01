class ArticlesController < ApplicationController
   def index
      @articles = Article.all
   end
   def new
      @article = Article.new
   end
   
   def edit
      @article = Article.find(params[:id])
   end
   
   def update
      @article = Article.find(params[:id])
      if @article.update(article_params)
         flash[:notice] = "Article updated!"
         redirect_to article_path(@article)
      else
         render 'edit'
      end
   end
   
   def create
         @article = Article.new(article_params) #hits the article
      if @article.save
         flash[:notice] = "Article posted!" #flash in app.erb
         redirect_to article_path(@article) 
      else
         render 'new'
      end
   end
   
   def show
      @article = Article.find(params[:id])
   end
   
   private
      def article_params
         params.require(:article).permit(:title,:description)
      end
end