feature 'User can sign in' do
  scenario 'User enters login details' do
    visit ('/')
    click_button("Sign in")
    expect(page).to have_content("Enter your email")
    expect(page).to have_content("Enter your password")
    
  end
end