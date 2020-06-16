require 'sinatra/base'
require './lib/listing.rb'
require './lib/user.rb'
require 'json'

class Makersbnb < Sinatra::Base

  enable :sessions

get '/home' do
  File.read('public/index.html')
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
  File.read('public/add_listing.html')
end

post '/add-listing/add' do
  Listing.add(title: params['title'], description: params['description'], price: params['price'], postcode: params['postcode'])
  redirect '/add-listing/added'
end

get '/add-listing/added' do
  listing = Listing.view_all
  p listing
  File.read('public/added.html')
end


run! if app_file == $0

end
