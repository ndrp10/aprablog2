class ArticlesController < ApplicationController
    before_action :set_article, only: [:show, :edit, :update, :destroy]
    skip_before_action :authenticate_user!, only: [:index, :show, :events]
    
    def membersarea
        now = Date.today
        @user = User.find(current_user.id)
        
        if current_user.premium_until >= now || current_user.admin
            @articles = Article.where(private: "Yes").paginate(page: params[:page], per_page: 10).order(updated_at: :desc)    
        else
            redirect_to blog_path, notice: "You need to subscribe to access our members area"   
        end
        one_week_ago = now - 7
        if current_user.premium_until <= one_week_ago && current_user.admin.nil?
            UserMailer.membershipexpiring(@user).deliver
        else
        end
    end

    def events
        @articles = Article.where(typetag: "Event", private: "No").paginate(page: params[:page], per_page: 10).order(updated_at: :desc) 
    end


    def new
        @article = Article.new
        
        if current_user.admin == 'false'
            redirect_to root_path
        else
            render 'new'
        end
    end

    def index
    
        @articles = Article.where(typetag: "Article", private: "No").paginate(page: params[:page], per_page: 10) 
             
    end

    def create
        
            @article = Article.new(article_params)

            if @article.save
             flash[:notice] = "Article was successfully created"
             redirect_to article_path(@article)
            else
             render 'new'
            end
     end


    def show
        @article = Article.find(params[:id])   
       
            @word_count = WordsCounted.count(@article.rich_body.to_s)
            @words_per_m = 270
            @word_number = @word_count.token_count
            @read_time = @word_number / @words_per_m

            if @read_time <= 0
                @read_time_rounded = @read_time + 1
            else
                @read_time_rounded = @read_time
            end 
    end

    def edit

        if current_user.admin == 'false'
            redirect_to root_path
        else
            render 'edit'
        end
        
    end

    def update
        
        if @article.update(article_params)    
            flash[:notice] = "Article was updated succesfully."
            redirect_to @article
        else
            render 'edit'
            flash[:notice] = "Article was not saved. Fields were missing."
        end

    end

    def destroy 
        @article.destroy
        redirect_to articles_path
    end

private 

    def set_article
        @article = Article.find(params[:id])
    end

    def article_params
        params.require(:article).permit(:title, :subtitle, :content, :typetag, :photo, :rich_body, :author, :private )
    end

end