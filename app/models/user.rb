class User < ActiveRecord::Base 
validates_presence_of :name, :username
validates_uniqueness_of :username

has_secure_password
has_many :riddle_posts
end


#User inherits ActiveRecord gem because it is the ORM that is being used in the sinatra project
#Base is the module
#it allows us to activerecord menthod : authenticate , which will take passwords as a plain string and checks it against
# bcrypts hashing algorithms to verify password

#add associates 