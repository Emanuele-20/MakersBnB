feature 'add-listing' do
  scenario 'click add-list button and fill the form' do
    visit ('/')
    click_button('New Listing')
    expect(page).to have_content('Add new listing')
 end
end
