class UserController < ApplicationController

    get '/login' do
        erb :'/users/login'
    end 

    post '/login' do 
        user = User.find_by(username: params[:username])
        session[:user_id] = user.id
    end 

    get '/signup' do
        erb :'users/signup'
    end 

end 