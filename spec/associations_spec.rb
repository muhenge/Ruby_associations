require 'rails_helper'

RSpec.describe 'Attend_event', type: :feature do
  before do
    User.create(username: 'spec_user')
    Event.create(description: 'Spec', date: '2020-12-10', creator_id: '1')
    visit 'http://localhost:3000/sessions/login'
    fill_in 'user[username]', with: 'spec_user'
    click_on 'Log in'
  end

  scenario 'attend an event' do
    visit 'http://localhost:3000/event_attendings/index'
    click_on 'Attend'
    expect(page).to have_content('Attended successfuly the event')
  end
end
