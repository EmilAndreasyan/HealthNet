class PatientsController < ApplicationController
    # before do
    #     require_login
    # end

    get '/patients' do
        require_login
        @patients = Patient.all
        erb :'patients/index'
    end

    # Create
    get '/patients/new' do
        require_login
        # @diseases = Disease.all
        erb :'patients/new'         
    end

    post '/patients' do
        @patient = current_user.patients.build(params[:user][:patient][0])
        # @patient = Patient.new(params[:user][:patient][0])
        if @patient.save
            redirect "/patients/#{@patient.id}"
        else
            @error = "All fields must be filled out"
            redirect "/patients/new"
        end
    end

    # Read
    get '/patients/:id' do
        require_login
        @patient = Patient.find(params[:id])
        erb :"patients/show"  
    end    

    # Update
    get '/patients/:id/edit' do
        require_login
        @patient = Patient.find(params[:id])
        erb :'patients/edit'  
    end

    patch '/patients/:id' do
        @patient = Patient.find(params[:id])
        if !params[:user][:patient][0].empty?
            # !params["user"]["patient"][0]["name"].empty? && !params["user"]["patient"][0]["gender"].empty?
            @patient.update(params[:user][:patient][0])
            # why redirecting to params[:id] rather than @patient.id?
            redirect "/patients/#{@patient.id}"
        else
            @error = "Try again"
            redirect "/patients/#{@patient.id}/edit"
        end
    end

    # Delete

    delete '/patients/:id' do
        @patient = Patient.find(params[:id])
        @patient.destroy
        redirect "/patients"
    end
end