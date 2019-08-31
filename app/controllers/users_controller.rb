class UsersController < ApplicationController
  
    get '/login' do
        erb :login
    end

    get '/signup' do
    end
end

  #purpose is to render the log in form
#no Base bc we want methods to be available to all other controllers 