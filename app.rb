require 'sinatra/base'
require './lib/listing.rb'
require './lib/user.rb'

class Makersbnb < Sinatra::Base
  
  enable :sessions, :method_override

get '/' do
 erb :homepage
end

get '/sign-up' do
  erb :sign_up
end

post'/sign-up' do
  User.create(username: params['username'], email: params['email'], password: params['password'])
  redirect '/home'
end

get '/add-listing' do
  erb :add_listing
end

post '/add-listing/add' do
  start = params['daterange'][0..9]
  finish = params['daterange'][13..22]
  daterange = Listing.date_format(start: start, finish: finish)
  p daterange
  Listing.add(title: params['title'], description: params['description'], price: params['price'], postcode: params['postcode'], availability: daterange)
  redirect '/add-listing/added'
end

get '/add-listing/added' do
  @listing = Listing.view_all
  erb :added
end

get '/view-listings' do
  @all_listing = Listing.view_all
  erb :view_listings
end

get '/check-availability' do
  @available_list = Listing.available_properties
  erb :check_availability
end

post '/check-availability' do
  date = DateTime.parse(params['date']).strftime('%Y-%m-%d')
  @list = Listing.check_available_listings(date: date)
  redirect '/check-availability'
end

get '/my-listings' do
  @my_listing = Listing.view_all
  erb :my_listings
end

get '/my-listings/:id/edit' do
  @edit_listing = Listing.find_listing(listingid: params['id'])
  erb :edit_listing
end

patch '/my-listings/:id' do
  Listing.edit_listing(listingid: params['id'], title: params['title'], description: params['description'], price: params['price'], postcode: params['postcode'])
  redirect '/my-listings'
end

delete '/my-listings/:id' do
  p params['id']
  Listing.delete_listing(listingid: params['id'])
  redirect '/my-listings'
end

run! if app_file == $0

end
