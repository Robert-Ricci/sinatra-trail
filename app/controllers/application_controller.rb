require './config/environment'
require 'rack-flash'

class ApplicationController < Sinatra::Base
  enable :sessions
  use Rack::Flash

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    use Rack::Flash
    set :session_secret, "secret"
    
  end

  get "/" do
    erb :welcome
  end

  helpers do

    def current_user
        @user ||= User.find(session[:user_id]) 
         
    end

    def is_logged_in?
       !!session[:user_id]
    end
  end
end
