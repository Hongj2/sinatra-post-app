require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
		set :session_secret, "password_security"
  end

  get "/" do
    erb :welcome
  end

  get "/success" do
		 if logged_in?
			erb :success
		 else
		 	redirect "/failure"
		 end
	end

  get "/failure" do
		erb :failure
	end

  helpers do
		def logged_in?
			!!session[:user_id]
		end

		def current_user
			User.find(session[:user_id])
		end
	end

  get "/logout" do
		session.clear
		redirect "/"
  end
  
end
