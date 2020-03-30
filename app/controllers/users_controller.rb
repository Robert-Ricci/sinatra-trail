class UsersController < ApplicationController

    get "/signup" do 
        
        erb :"user/signup"
    end

    post "/signup" do 
        user = User.create(params)
        if user.valid?
            session[:user_id] = user.id 
            redirect to "user/#{user.id}"
        else
            redirect to "/signup"
        end
    end

    get "/login" do
        erb :"user/login"
    end

end
