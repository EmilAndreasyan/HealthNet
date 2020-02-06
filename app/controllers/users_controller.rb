class UsersController < ApplicationController
    get '/signup' do
        erb :'users/signup'
    end

    # post '/signup' do
    #     user = User.new(params[:user])
    #     if user.first_name.empty? || user.last_name.empty? || user.password_digest.empty? || user.email.empty?
    #         @error = "All fields are required*"
    #         redirect "/signup"
    #     elsif User.find_by(email: user.email)
    #         @error = "Acount already exists*"
    #         redirect "/login"
    #     else
    #         user.save
    #         session[:user_id] = user.id
    #         redirect "/users/#{user.id}/index"
    #     end
    # end

    post '/signup' do
        #binding.pry
        user = User.new(params[:user])
        if user.first_name.empty? || user.last_name.empty? || user.password.empty? || user.email.empty?
           @error = "all feilds are required*" 
           erb :'users/signup'
        elsif 
            User.find_by(email: user.email)
            @error = "account already exists, try to login instead*"
            erb :'users/signup'
        else
            user.save
            session[:user_id] = user.id
            redirect "/users/#{user.id}/index"
        end
    end
end