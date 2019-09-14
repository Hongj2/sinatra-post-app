class UsersController < ApplicationController
 
#renders the log in form
  get '/login' do
    erb :"/main_page/login"
  end

#recieve the login form to find user and log user in  by finding the user
  post "/login" do
   
    user = User.find_by(:username => params[:username]) 
    #verify user though key value pair
      if user && user.authenticate(params[:password])
        session[:user_id]= user.id
        #this is what actually logs the user in and session hash is assigned with key-value 
        redirect "/users/home"
      else
        redirect "/failure"
      end
      
  end

# renders a form to create a new user. The form includes fields for username and password.
  get "/signup" do
    erb :"/main_page/signup"
  end


#make a new instance of our user class with a username and password from params. Note that even though our database has a #column called password_digest, we still access the attribute of password. This is given to us by has_secure_password
  post "/signup" do
    @user = User.new(params)
      @user.save
      session[:user_id] = @user.id
      redirect "users/home"    
  end

  get "/users/home" do
    @user = User.find_by_id(session[:user_id])
		 if @user
			erb :"/users/home"
		 else
		 	redirect "/failure"
		 end
	end

    

end
