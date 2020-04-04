class UsersController < ApplicationController

    get "/signup" do 
        if is_logged_in?
            redirect to '/hikes'
         else
            erb :'users/signup'
         end
    end

    post "/signup" do 
        user = User.create(params)
        if user.valid?
            session[:user_id] = user.id 
            redirect to "users/#{user.id}"
        else
            redirect to "/signup"
        end
    end

    get "/login" do
        if is_logged_in?
            redirect to '/hikes'
        else 
            erb :"users/login"
        end
    end

    post "/login" do 
        user = User.find_by(username: params[:username])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect to "/users/#{user.id}"
        else
            redirect to '/signup'
        end
    end

    get '/users/:id' do
        if is_logged_in? && User.find_by(id: params[:id])
          @user = User.find_by(id: params[:id])
          @hikes = @user.hikes
        else
          redirect to '/'
        end
        erb :'users/show'
      end

      get "/logout" do 
        session.clear
        redirect to "login"
      end
end
