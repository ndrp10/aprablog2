class UsersController < ApplicationController
    # GET /users/:id
    def show
        
    end

    def index
        if current_user.admin == 'false'
            redirect_to root_path
        else
            render 'index'
        end
        respond_to do |format|
            format.html
            format.csv { send_data User.to_csv, filename: "allUsers.csv"}
        end   
    end
    
end
