class UsersController < ApplicationController

    get "/users" do
        @users = User.all
        erb :"users/index"
    end
    
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
            flash[:signup_error] = "Invalid Signup, please try again."
            erb :"/users/signup"
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
            flash.now[:login_error] = "Invalid Login, please try again."
            erb :'/users/login'
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

      get "/users/:slug" do
        slug = params[:slug]
        binding.pry
        @user = User.find_by_slug(slug)
        erb :"users/show"
      end
    
    
end
