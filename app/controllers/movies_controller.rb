class MoviesController < ApplicationController

    get '/movies' do
        redirect_if_not_logged_in
        erb :'movies/index'
    end 

end 