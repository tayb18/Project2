module App
  class Server < Sinatra::Base
    set :method_override, true
    enable :sessions

    get "/" do
      erb :index
    end

    get "/login" do
      erb :login
    end

    get "/users/new" do
      erb :new_user
    end

    post "/users" do
      User.create(name: params[:name], usernme: params[:username])
      redirect to "/homepage"
    end

    get "/homepage" do
      @user = User.find(session[:user_id]) if session[:user_id]
      erb :homepage
    end

  end #class
end #module