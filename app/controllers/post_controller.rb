class PostsController < ApplicationController

#CRUD
get '/posts/new' do 
    erb :"/posts/new"
end

get '/posts' do 
    @riddle_posts = RiddlePost.all   
    erb :"/posts/index"
end

get '/posts/:id' do  
    @riddle_post = RiddlePost.find_by_id(params[:id])
    erb :"/posts/edit"  
end

#    get '/posts/:id/edit' do 
#     @riddle_posts = RiddlePost.find_by_id(params[:id])
#     erb :edit
    
patch '/posts/:id' do  
    @riddle_posts = RiddlePost.find_by_id(params[:id])
    @riddle_posts.title = params[:title]
    @riddle_posts.content = params[:content]
    @riddle_posts.save
    redirect to "/posts/#{@riddle_posts.id}"
end

post '/posts' do  
    @riddle_posts = RiddlePost.create(params)
    redirect to "/posts/#{@riddle_posts.id}"
end

delete '/posts/:id' do 
    @riddle_posts = RiddlePost.find_by_id(params[:id])
    @riddle_posts.delete
    redirect to '/posts'  
end

get "/posts/userpost" do
    @riddle_posts.where("user_id= #{session[:user_id]}")    
      erb :"/users/userpost"
    end
end
