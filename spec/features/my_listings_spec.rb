feature "user can see their own listings page" do
  scenario "see my listing on the page" do
    visit ('/home')
    click_button('View My Listings')

    expect(current_path).to eq '/my_listings'
    expect(page).to have_content 'My Listings'
  end
end

feature "user can go back and add a new listing" do
  scenario "user click button and go to add listing page" do
    visit ('/my_listings')
    click_button('Add a new Listing')
    expect(current_path).to eq '/add-listing'
  end
end