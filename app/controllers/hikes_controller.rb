class HikesController < ApplicationController

    get "/hikes" do 
        if !is_logged_in?
            redirect to "/login"
        else 
          @hikes = Hike.all
           @user = current_user
           erb  :"hikes/index"
        end
    end

    get "/hikes/new" do
        if !is_logged_in? 
            redirect to "/login"
        end
        erb :"/hikes/new"
    end

    post "/hikes" do
        hike = Hike.create(params)
        user = current_user
        hike.user = user
        hike.save
        redirect to "/users/#{user.id}"
    end

    get "/hikes/:id" do
        if !is_logged_in?
            redirect to "/users/login"
        end
        @hike = Hike.find_by(id: params[:id])
        erb :"/hikes/show"
    end

    get "/hikes/:id/edit" do
        @hike = Hike.find_by(id: params[:id])
        #binding.pry
        erb :'/hikes/edit'
    end
end
