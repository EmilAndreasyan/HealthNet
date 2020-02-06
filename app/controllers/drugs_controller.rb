class DrugsController < ApplicationController
    get '/drugs' do
        @drugs = Drug.all
        erb :'drugs/index'
    end

    get '/drugs/new' do
        erb :'drugs/new'
    end

    post '/drugs' do
        @drug = Drug.new(params[:drug])
        if !params[:drug].empty?
            @drug.save
            redirect "/drugs/#{@drug.id}"
        else
            @error = "All field must be filled out"
            erb :'drugs/new'
        end
    end

    get '/drugs/:id' do
        @drug = Drug.find(params[:id])
        erb :'drugs/show'
    end

    get '/drugs/:id/edit' do
        @drug = Drug.find(params[:id])
        erb :'drugs/edit'
    end

    patch '/drugs/:id' do
        @drug = Drug.find(params[:id])
        if !params.empty?
            @drug.update(params[:drug])
            redirect "/drugs/#{params[:id]}"
        else
            @error = "Fill all the fields"
            erb :'drugs/edit'
        end
    end

    delete '/drugs/:id' do
        @drug = Drug.find(params[:id])
        @drug.destroy
        redirect "/drugs"
    end
end 