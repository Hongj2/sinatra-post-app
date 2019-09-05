class UsersController < ApplicationController
 
#CRUD
get '/riddle_posts/new' do 
    erb :new
  end

   get '/riddle_posts' do 
    @riddle_posts = RiddlePost.all
    erb :index
  end

   get '/riddle_posts/:id' do  
    if riddle.user_id == session[:user_id]
    @riddle_post = RiddlePost.find_by_id(params[:id])
    erb :show
    end
  end

   get '/riddle_posts/:id/edit' do 
    if riddle.user_id == session[:user_id]
    @riddle_post = RiddlePost.find_by_id(params[:id])
    erb :edit
    end
  end

   patch '/riddle_posts/:id' do  
    if riddle.user_id == session[:user_id]
    @riddle_post = RiddlePost.find_by_id(params[:id])
    @riddle_post.title = params[:title]
    @riddle_post.content = params[:content]
    @riddle_post.save
    redirect to "/riddle_posts/#{@riddle_post.id}"
    end
  end

   post '/riddle_posts' do  
    if riddle.user_id == session[:user_id]
    @riddle_post = RiddlePost.create(params)
    redirect to "/riddle_posts/#{@riddle_post.id}"
    end
  end

   delete '/riddle_posts/:id' do 
    if riddle.user_id == session[:user_id]
    @riddle_post = RiddlePost.find_by_id(params[:id])
    @riddle_post.delete
    redirect to '/riddle_posts'
    end
  end
    

end
