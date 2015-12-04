module App 
  class Server < Sinatra::Base
    set :method_override, true
    enable :sessions

    get "/" do
      @user = User.find(session[:user_id]) if session[:user_id]
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
      user = User.find_by({username: params[:username]})
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
      User.create({name: params[:name], username: params[:username]})
      redirect to "/login"
    end

    get "/homepage" do
      redirect to "/" if !session[:user_id]
      @user = User.find(session[:user_id])
      @articles = Article.all
      article = Article.find_by({id: params[:id]})
      # @user = User.find(session[:user_id]) if session[:user_id])
      erb :homepage
    end

    delete "/homepage" do
      session[:user_id] = nil
      redirect to "/"
    end

    get "/new_article" do
      @user = User.find(session[:user_id])
      erb :new_article
    end

    post "/new_article" do
      article = Article.create({title: params[:title], content: params[:content], id: params[:id]})

      redirect to "/articles/:id"
    end

    get "/articles/:id" do
      @user = User.find(session[:user_id])
      @this_article = Article.find(params[:id])

      erb :article
    end

    get "/articles/:id/update_article" do
      @user = User.find(session[:user_id])
      @article = Article.find(params[:id])
      erb :update_article 
    end

    post "/articles/:id/update_article" do
      article = Article.create({title: params[:title], content: params[:content]})
      redirect to "/articles/:id"
    end

  end #class
end #module