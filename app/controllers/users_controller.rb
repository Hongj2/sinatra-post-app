class UsersController < ApplicationController
  
    get '/login' do
        erb :login
    end
    
    post "/login" do
        user = User.find_by(:username => params[:username])
         
          if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect "/success"
          else
            redirect "/failure"
          end
            end
  

    get "/signup" do
		erb :signup
	end
# renders a form to create a new user. The form includes fields for username and password.

	post "/signup" do
	user = User.new(:username => params[:username], :password => params[:password])
	#make a new instance of our user class with a username and password from params. Note that even though our database has a #column called password_digest, we still access the attribute of password. This is given to us by has_secure_password
	 if user.save
    redirect "/login"
  else
    redirect "/failure"
  end
  
    end



    

end

  #purpose is to render the log in form
#no Base bc we want methods to be available to all other controllers 
# the purpose fo post 'login' is to recieve the login form to find user and log user in 