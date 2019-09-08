class UserController < ApplicationController

    get '/users/login' do
        erb :'/users/login'
    end 

    post '/users/login' do 
        user = User.find_by(username: params[:username])
        session[:user_id] = user.id
    end 

    get '/users/signup' do
        if !session[:user_id]
            erb :'users/new'
        else
            redirect '/index'
        end 
    end 

    post '/users/login' do 
        user = User.create(username: params[:username], password: params[:password])
        session[:user_id] = user.id 
    end 

end 