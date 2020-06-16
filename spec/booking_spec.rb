require 'booking'
require 'timecop'


describe Booking do
  describe ".add" do
    it 'should add new booking' do
      Timecop.freeze(Time.parse('16 June 2020'))
      listing = Listing.add(title: 'Test listing', description: 'Amazing place', price: 100, postcode: 'N1 4RL')

      booking = Booking.add(1,'16 June 2020')
      expect(Booking).to be Booking
      expect(Booking.id).to eq 1


    end
  end
end
