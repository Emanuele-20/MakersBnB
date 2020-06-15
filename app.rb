require 'sinatra/base'
require './lib/listing.rb'

class Makersbnb < Sinatra::Base

  enable :sessions

get '/' do
 erb :homepage
end

get '/add-listing' do
  erb :add_listing
end

post '/add-list/add' do
  #add params for table here
  redirect '/' 
end


# get '/login' do

# end

# get '/sign-in' do

# end


run! if app_file == $0

end
