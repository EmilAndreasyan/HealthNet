class DiseasesController < ApplicationController
    get '/diseases' do
        @diseases = Disease.all
        erb :'diseases/index'
    end
    #Create new
    get '/diseases/new' do
        erb :'diseases/new'
    end

    post '/diseases' do
        @disease = Disease.new(params[:disease])
        if !params[:disease].empty?
            @disease.save
            redirect "/diseases/#{@disease.id}"
        else
            @error = "All fields are required"
            redirect "/diseases/new"
        end
    end
    #Read show
    get '/diseases/:id' do
        @disease = Disease.find(params[:id])
        erb :'diseases/show'
    end

    get '/diseases/:id/edit' do
        @disease = Disease.find(params[:id])
        erb :'diseases/edit'
    end

    patch '/diseases/:id' do
        @disease = Disease.find(params[:id])
        if !params[:disease].empty?
            @disease.update(params[:disease])
            redirect "/diseases/#{params[:id]}"
        else
            redirect "/diseases/edit"
        end
    end

    delete '/diseases/:id' do
        @disease = Disease.find(params[:id])
        @disease.destroy
        redirect "/diseases"
    end
end