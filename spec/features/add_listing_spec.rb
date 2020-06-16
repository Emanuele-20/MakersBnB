feature 'Adding a new listing to site' do
  scenario 'User sees form and can fill in form' do
    visit ('/home')
    click_button('New Listing')
    expect(page).to have_content('Add new listing')
    expect(page).to have_content('Listing Name')
    expect(page).to have_content('Add a short description')
    expect(page).to have_content('Price Per Night')
    expect(page).to have_content('Postcode')
 end
end

feature 'Adding a new listing to site' do
 scenario 'User fills in form and sees submitted page' do
  visit('/home')
  click_button('New Listing')
  fill_in "Listing Name", with: "Cosy Cottage"
  fill_in "description", with: "3 bed in the Cotswolds"
  fill_in "price", with: "150"
  fill_in "postcode", with: "C01 4ED"
  click_button'Submit'
  expect(page).to have_content("You've just added a new space:")
  expect(page).to have_content("Cosy Cottage")
  expect(page).to have_content("3 bed in the Cotswolds")


 end
end
