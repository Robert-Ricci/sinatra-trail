class HikesController < ApplicationController

    get "/hikes" do
        @hikes = Hike.all 
        erb :"/hikes/index"
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
        if !is_logged_in?
            redirect to "/users/login"
        end
        @hike = Hike.find_by(id: params[:id])
        erb :'/hikes/edit'
    end

    patch "/hikes/:id" do
        hike = Hike.find_by(id: params[:id])
        if hike && hike.user == current_user
            hike.update(params[:hike])
            redirect to "/hikes/#{hike.id}"
        else
            redirect to "/hikes"
        end
    end

    delete "/hikes/:id/delete" do
        hike = Hike.find_by(id: params[:id])
        if hike && hike.user == current_user
            hike.destroy
        end
        redirect to "/hikes"
    end
end
