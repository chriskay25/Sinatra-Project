class UserController < ApplicationController

    get '/login' do
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
            redirect 'movie/index'
        end 
    end 

    post '/signup' do 
        if params[:username] == "" || params[:password] == ""
            redirect to '/signup'
        else
            @user = User.create(username: params[:username], password: params[:password])
            session[:user_id] = @user.id 
            # need to redirect the user somewhere once they're signed up.
            erb :'movies/index'
        end 
    end 


end 