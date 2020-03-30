class UsersController < ApplicationController

    get "/signup" do 
        
        erb :"user/signup"
    end

    post "/signup" do 
        user = User.create(params)
    
    end
    get "/login" do
        erb :"user/login"
    end

end
