class MoviesController < ApplicationController

    get '/movies' do
        redirect_if_not_logged_in
        @user = User.find_by(id: session[:user_id])
        erb :'movies/index'
    end 

    get '/movies/new' do
        redirect_if_not_logged_in
        erb :'movies/new'
    end 

    post '/movies' do
        redirect_if_not_logged_in
        user = User.find_by(id: session[:user_id])
        user.movies.build(title: params[:title], genre: params[:genre])
        user.save
        redirect '/movies'
    end 

end 