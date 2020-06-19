require 'rails_helper'

RSpec.describe 'log_in', type: :feature do
  before { User.create(username: 'login_user') }

  scenario 'log_in valid' do
    visit 'http://localhost:3000/sessions/login'
    fill_in 'user[username]', with: 'login_user'
    click_on 'Log in'
    expect(page).to have_content('Welcome:')
  end

  scenario 'log_in invalid' do
    visit 'http://localhost:3000/sessions/login'
    fill_in 'user[username]', with: 'login_wrong'
    click_on 'Log in'
    expect(page).to have_content('Incorrect username')
  end
end
