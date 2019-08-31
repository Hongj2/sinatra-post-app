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

#renders the log in form
  get '/login' do
    erb :login
  end

#recieve the login form to find user and log user in 
  post "/login" do
    user = User.find_by(:username => params[:username])
    
      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect "/success"
      else
        redirect "/failure"
      end
  end

# renders a form to create a new user. The form includes fields for username and password.
  get "/signup" do
    erb :signup
  end


#make a new instance of our user class with a username and password from params. Note that even though our database has a #column called password_digest, we still access the attribute of password. This is given to us by has_secure_password
  post "/signup" do
    user = User.new(:username => params[:username], :password => params[:password])
      if user.save
      redirect "/login"
      else
      redirect "/failure"
      end
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
  

  get '/index' do
    erb :index
  end

end
