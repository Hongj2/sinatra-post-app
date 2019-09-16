require './config/environment'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

use Rack::MethodOverride #allows us to send patch and delete request
use UsersController
use PostsController
run ApplicationController
#the purpose of the last line is to start the ruby class application 
# with the start of the new ruby class, it generates a new instance that response to the request of the user

# 'RUN' is the mounting method , mounting a controller tells RACK that the part of you web appication is define within the following class 

# the purpose in using 'shotgun' is to avoid using [save, stop, restart ]cycle of rackup 
# SHOTGUN is an gem that test rack-based ruby apps locally by starting RACK w automatic code and reloading 
# configure block tells the controller where to look to find the views (your pages with HTML to display text in the browser) and the public directory
