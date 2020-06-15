feature 'add-listing' do
  scenario 'click add-list button and fill the form' do
    visit ('/')
    click_button('New Listing')
    expect(page).to have_content('Add new listing')
    expect(page).to have_content('Listing Name')
    expect(page).to have_content('Add a short description')
    expect(page).to have_content('Price Per Night')
    expect(page).to have_content('Postcode')
 end
end
