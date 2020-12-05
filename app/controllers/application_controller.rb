require_relative '../../config/environment'
class ApplicationController < Sinatra::Base
  configure do
    set :views, Proc.new { File.join(root, "../views/") }
    enable :sessions unless test?
    set :session_secret, "secret"
  end

  get '/' do
    erb :index
  end

  get '/error' do
    erb :error
  end

  post '/login' do
    #binding.pry
      @user = User.all.find_by_username(params[:username])
      
      if @user
      session[:user_id] = @user.id
     
      redirect '/account'
    else erb :error
    end
  end

  get '/account' do
    
    if Helpers.is_logged_in?(session)
      @user = User.all.find(session[:user_id])
      #binding.pry
    erb :account
    else erb :error
    end
  end

  get '/logout' do
    session.destroy
    redirect '/'
  end
  
  post '/logout' do
    
    redirect '/'
  end


end

