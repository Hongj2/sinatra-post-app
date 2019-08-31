Class User < ActiveRecord::Base 
#User inherits ActiveRecord gem because it is the ORM that is being used in the sinatra project
#Base is the module
has_secure_password
#it allows us to activerecord menthod : authenticate , which will take passwords as a plain string and checks it against
# bcrypts hashing algorithms to verify password
#add associates 
end
