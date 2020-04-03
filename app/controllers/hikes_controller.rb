class HikesController < ApplicationController

    get "/hikes" do 
      
        # if !is_logged_in?
        #     redirect to "/login"
        # else 
          @hikes = Hike.all
        #   @user = current_user
           erb  :'/hikes/index'
       #
    end


end
