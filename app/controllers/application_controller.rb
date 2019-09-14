require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
		set :session_secret, "password_security"
  end
#creates a session id and provides an extra layer of security = creates a session hash that we can manipulate
  get "/" do
    erb :"/main_page/welcome"
  end

  get "/failure" do
		erb :"/main_page/failure"
	end

  helpers do
		def logged_in?
      !!session[:user_id]
      #double bang takes a value and turns it into a boolean reflection of it truth to the truthiness of the object
		end

		def current_user
      User.find(session[:user_id])
      #could use @current_user ||= to reduce the amount of database retreival 
		end
	end

  get "/logout" do
		session.clear
		redirect "/"
  end
  

  get '/index' do
    erb :"/posts/index"
  end


end
