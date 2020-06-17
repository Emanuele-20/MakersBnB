require 'listing'
require 'booking'
require 'timecop'

describe Listing do
  
  describe '.add' do
  
    it 'should add a new listing' do
      listing = Listing.add(title: 'Test listing', description: 'Amazing place', price: 100, postcode: 'N1 4RL')

      expect(listing).to be_a Listing
      expect(listing.title).to eq 'Test listing'
      expect(listing.price).to eq 100
      expect(listing.description).to eq 'Amazing place'
      expect(listing.postcode).to eq 'N1 4RL'
    end
  end

  describe '.view_all' do

    it 'should return all listings' do
      listing = Listing.add(title: 'Test listing', description: 'Amazing place', price: 100, postcode: 'N1 4RL')
      Listing.add(title: 'Test listing2', description: 'Another amazing place', price: 90, postcode: 'N5 4RL')
      Listing.add(title: 'Test listing3', description: 'Lastamazing place', price: 200, postcode: 'E5 4RL')

      listings = Listing.view_all

      expect(listings.length).to eq 3
      expect(listings.first).to be_a Listing
      expect(listings.first.title).to eq 'Test listing'
    end
  end

  describe '.available_listings' do
    it 'should only return available listings' do
      
    Timecop.freeze(Time.parse('16 June 2020'))
    listing = Listing.add(title: 'Test listing', description: 'Amazing place', price: 100, postcode: 'N1 4RL')
    booking = Booking.add(date: '16 June 2020', listingid: listing.id)
    available = Listing.available_listings

    expect(available).not_to include(listing.id)

    end

  end

end