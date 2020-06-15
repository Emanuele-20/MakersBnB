require 'listing'

describe Listing do
  
  describe '.add' do
  
    it 'should add a new listing' do
      listing = Listing.add(title: 'Test listing', description: 'Amazing place', price: 100, postcode: 'N1 4RL')

      expect(listing).to be_a Listing
      expect(listing.title).to eq 'Test listing'
      expect(listing.price).to eq 100
    end

  end

end