feature 'New User can sign up' do
  scenario 'User sees sign in page and fills in details' do
    visit ('/')
    expect(page).to have_content('Enter you email')
    expect(page).to have_content('Enter a password')
    expect(page).to have_content('Confirm password')
    click_button('Sign Up')
 end
end