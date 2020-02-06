class SessionsController < ApplicationController
    get '/login' do
        erb :'users/login'
    end

    # post '/login' do
    #     user = User.new(params[:user])
    #     if params[:user].empty?
    #         @error = "All fields are required*"
    #         redirect '/login'
    #     elsif
    #         user = User.find_by(params[:user])
    #         session[:user_id] = user.id
    #         redirect "/users/#{user.id}/index"
    #     else
    #         @error = "Account not found, try again or register!"
    #         redirect "/login" 
    #     end
    # end

    # post '/login' do
    #     user = User.find_by(params[:user])
    #     if params.empty?
    #         @error = "all fields are required"
    #         erb :'users/login'
    #     elsif user
    #         session[:user_id] = user.id
    #         redirect "/users/#{user.id}/index"
    #     else
    #         @error = "Account not found, try again or register!"
    #         erb :'users/login'
    #     end
    # end

    post '/login' do
        user = User.find_by(email: params[:user][:email])
        if params[:user][:email].empty? || params[:user][:password].empty?
            @error = "Email and password fields cannot be blank*"
            erb :'users/login' 
        elsif user && user.authenticate(params[:user][:password])
            user.save
            session[:user_id] = user.id
            redirect "/users/#{user.id}/index"
        else
            @error = "Incorrect email or password*"
            erb :'users/login'
        end
    end

    get '/logout' do
    session.clear
    redirect '/'
    end
end