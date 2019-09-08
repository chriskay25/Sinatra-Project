class UserController < ApplicationController

    get '/users/:id' do
        redirect '/' if !logged_in?

        @user = User.find(params[:id])
        if !@user.nil? && @user == current_user
            erb :'users/show'
        else
            redirect '/'
        end
    end 

    get '/login' do
        # redirect '/movies' if logged_in? 
        @failed = false
        erb :'users/login'
    end 

    post '/login' do 
        user = User.find_by(username: params[:username])
        if !!user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect '/movies'
        else
            @failed = true
            erb :'users/login'
        end 
    end 

    get '/signup' do
        if !session[:user_id]
            erb :'users/new'
        else
            redirect ''
        end 
    end 

    post '/signup' do 
        if params[:username] == "" || params[:password] == ""
            redirect to '/signup'
        else
            @user = User.create(username: params[:username], password: params[:password])
            session[:user_id] = @user.id 
            # need to redirect the user somewhere once they're signed up.
            erb :'users/show'
        end 
    end 

    get '/logout' do 
        if session[:user_id] != nil
            session.destroy
            redirect '/'
        else
            redirect '/'
        end 
    end 


end 