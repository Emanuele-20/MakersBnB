require 'sinatra/base'
require './lib/listing.rb'

class Makersbnb < Sinatra::Base

get '/' do
 erb :homepage
end

get '/add-listing' do
  
end


# get '/login' do

# end

# get '/sign-in' do
  
# end


run! if app_file == $0

end
