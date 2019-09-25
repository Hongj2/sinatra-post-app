class PostsController < ApplicationController

#model.new
get '/posts/new' do 
    @riddle_post = RiddlePost.new
    erb :"/posts/new"
end
#model.read
get '/posts' do 
    @riddle_posts = RiddlePost.all   
    erb :"/posts/index"
end

#model.create
post '/posts' do  
    @riddle_post = RiddlePost.create(params)
    @riddle_post.user = current_user
    @riddle_post.save
    redirect to "/posts/#{@riddle_post.id}"
end

get '/posts/edit' do  
    @riddle_post.user = current_user
    @riddle_post = RiddlePost.where("user_id= #{session[:user_id]}")
    redirect to "/users/userpost"  

end

get "/users/userpost" do
    @riddle_post= RiddlePost.where("user_id=#{session[:user_id]}")  
      erb :"/users/userpost"
    end    

#model.update_one_post
get '/posts/:id' do  
    @riddle_post = RiddlePost.find_by_id(params[:id])
    if @riddle_post.user == current_user 
    erb :"/posts/edit" 
    else
     erb :"/users/home"
    end
end

patch '/posts/:id' do  
    @riddle_post = RiddlePost.find_by_id(params[:id])
    @riddle_post.title = params[:riddle_post][:title]
    @riddle_post.content = params[:riddle_post][:content]
    @riddle_post.answer = params[:riddle_post][:answer]
    @riddle_post.save
    redirect to "/posts/#{@riddle_post.id}"
end

#model.destory
delete '/posts/:id/delete' do 
    RiddlePost.destroy(params[:id])
    redirect to '/posts'  
end


end
