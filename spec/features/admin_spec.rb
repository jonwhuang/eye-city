require 'rails_helper'

RSpec.feature 'Admin', type: :feature, js: true do
  before do
    admin = create(:admin)
  end

  it 'redirects to login if not signed in' do
    visit root_path
    expect(page.current_path).to eq new_admin_session_path
  end

  it 'can see the page title' do
    visit root_path
    expect(page).to have_content("EYE CITY OPTOMETRY")
  end

  it 'signs in successfully' do
    visit root_path
    fill_in "Email", with: "jonwhuang@gmail.com"
    fill_in "Password", with: "12345678"
    click_button('Log in')
    expect(page).to have_content("Returns Overview")
  end
end
