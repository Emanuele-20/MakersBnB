require 'user'

describe User do
  subject(:test_user) { described_class.new(id: 1, username: 'Al', email: 'al@al.com', password: 'alvin') }
  
  it 'should store a username, email and password' do
    expect(test_user.username).to eq 'Al'
    expect(test_user.email).to eq 'al@al.com'
    expect(test_user.password).to eq 'alvin'
  end

  describe ".create" do
    it "create a new user" do
      user = User.create(username: 'Al', email: 'al@al.com', password: 'alvin')

      expect(user).to be_a User
      expect(user.username).to eq "Al"
      expect(user.email).to eq "al@al.com"
    end
  end

  describe ".user_exists?" do
    it 'should check if a username is unique' do
      user = User.create(username: 'Al', email: 'al@al.com', password: 'alvin')

      expect(user.user_exists?).to be true
      expect(user.user_exists?('testperson')).to be false
    end
  end
end