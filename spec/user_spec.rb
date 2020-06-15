require 'user'

describe User do
  subject(:user) { described_class.new('Al', 'al@al.com', 'alvin') }
  
  it 'should store a username' do
    expect(user.username).to eq 'Al'
  end

end