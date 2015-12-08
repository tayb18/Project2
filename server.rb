module App  
  class Server < Sinatra::Base
    set :method_override, true
    enable :sessions
    $markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true, tables: true)

    get "/" do
      # @user = User.find(session[:user_id]) if session[:user_id]
      erb :index
    end

    get "/login" do
      erb :login
    end
 
    # this should happen when the user types in their name
    # and clicks "login!"
    post "/sessions" do
      # get the user's name from params
      # find the user's info from the db
      user = User.find_by({username: params[:username]}).try(:authenticate, params[:password])
      # put the user's id in session
      if user
        session[:user_id] = user.id
        # redirect to the homepage
        redirect to "/homepage"
      else
        redirect to "/login"
      end
    end

    get "/users/new" do
      erb :new_user
    end

    post "/users" do
      User.create({name: params[:name], username: params[:username], password: params[:password], password_confirmation: params[:password_confirmation]})
      redirect to "/login"
    end

    get "/homepage" do
      redirect to "/" if !session[:user_id]
      @user = User.find(session[:user_id])
      @articles = Article.all
      article = Article.find_by({id: params[:id]})

      erb :homepage
    end

    delete "/homepage" do
      session[:user_id] = nil
      redirect to "/"
    end

    get "/new_article" do
      redirect to "/" if !session[:user_id]
      @user = User.find(session[:user_id])

      erb :new_article
    end

    post "/new_article" do
      category = Category.find_by(id: params[:id]) || Category.create({name: params[:name]})
      article = Article.create({title: params[:title], date_created: DateTime.now ,content: params[:content], user_id: session[:user_id]})
      article.categories.push(category)
      article.save

      redirect to "/homepage"
    end

    get "/articles/:id" do
      redirect to "/" if !session[:user_id]
      @user = User.find(session[:user_id])
      @this_article = Article.find(params[:id])
      @category = Category.find(params[:id])
      @find_author = User.find(@this_article.user_id)

      erb :article
    end

    get "/articles/:id/update_article" do
      redirect to "/" if !session[:user_id]
      @user = User.find(session[:user_id])
      @article = Article.find(params[:id])
      @category = Category.find(params[:id])
      erb :update_article 
    end

    post "/articles/:id/update_article" do
      category = Category.find(params[:id])
      category.update({name: params[:name]})
      article = Article.find(params[:id])
      article.update({title: params[:title], content: params[:content]})
      redirect to "/homepage"
    end

    get "/articles/:id/add_category" do
      redirect to "/" if !session[:user_id]
      redirect to "/" if !session[:user_id]
      @user = User.find(session[:user_id])
      @this_article = Article.find(params[:id])
      @category = Category.find(params[:id])
      @find_author = User.find(@this_article.user_id)

      erb :add_category 
    end

    post "/articles/:id/add_category" do
      @user = User.find(session[:user_id])
      @this_article = Article.find(params[:id])
      category = Category.find_by(id: params[:id]) || Category.create({name: params[:name]})
      article = Article.find_by(id: params[:id])
      article.categories.push(category)
      article.save

      redirect to "/articles/:id"
    end

    get "/categories" do
      redirect to "/" if !session[:user_id]
      @categories = Category.all

      erb :categories
    end

    get "/categories/:id" do
      redirect to "/" if !session[:user_id]
      @category = Category.find(params[:id])
      @articles = @category.articles

      erb :category
    end

  end #class
end #module