class SessionsController < ApplicationController
    get '/login' do
        erb :'users/login'
    end

    post '/login' do
        user = User.new(params[:user])
        if params[:user].empty?
            @error = "All fields are required*"
            redirect '/login'
        # elsif   
        #     @error = "Account not found, try again or register!" 
        #     redirect "/login"
        elsif
            #user && user.authenticate(password_digest)
            user = User.find_by(params[:user])
            session[:user_id] = user.id
            redirect "/users/#{user.id}/index"
        else
            @error = "Account not found"
            redirect "/login" 
        end
    end

    get '/logout' do
    session.clear
    redirect '/'
    end
end