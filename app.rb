require 'sinatra/base'
require './lib/listing.rb'
require './lib/user.rb'

class Makersbnb < Sinatra::Base

  enable :sessions

get '/home' do
 erb :homepage
end

get '/' do
  erb :sign_up
end

post'/sign-up' do
  User.create(username: params['username'], email: params['email'], password: params['password'])
  redirect '/home'
end

get '/sign-in' do
  erb :sign_in
end

get '/add-listing' do
  erb :add_listing
end

post '/add-listing/add' do
  Listing.add(title: params['title'], description: params['description'], price: params['price'], postcode: params['postcode'])
  redirect '/add-listing/added'
end

get '/add-listing/added' do
  @listing = Listing.view_all
  p @listing
  erb :added
end


run! if app_file == $0

end
