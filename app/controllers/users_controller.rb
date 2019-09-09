class UsersController < ApplicationController
 
#CRUD
get '/riddle_posts/new' do 
    erb :"/post_page/new"
end

get '/riddle_posts' do 
    @riddle_posts = RiddlePost.all   
    erb :"/post_page/index"
end

get '/riddle_posts/:id' do  
    @riddle_post = RiddlePost.find_by_id(params[:id])
    erb :"/post_page/show"  
end

#    get '/riddle_posts/:id/edit' do 
#     @riddle_post = RiddlePost.find_by_id(params[:id])
#     erb :edit
    
patch '/riddle_posts/:id' do  
    @riddle_post = RiddlePost.find_by_id(params[:id])
    @riddle_post.title = params[:title]
    @riddle_post.content = params[:content]
    @riddle_post.save
    redirect to "/riddle_posts/#{@riddle_post.id}"
end

post '/riddle_posts' do  
    @riddle_post = RiddlePost.create(params)
    redirect to "/riddle_posts/#{@riddle_post.id}"
end

delete '/riddle_posts/:id' do 
    @riddle_post = RiddlePost.find_by_id(params[:id])
    @riddle_post.delete
    redirect to '/riddle_posts'  
end
    

end
