require 'rails_helper'

RSpec.describe 'New_event', type: :feature do
  before do
    User.create(username: 'spec_user')
    visit 'http://localhost:3000/sessions/login'
    fill_in 'user[username]', with: 'spec_user'
    click_on 'Log in'
  end
  scenario 'create an event' do
    visit 'http://localhost:3000/events/new'
    fill_in 'event[description]', with: 'event_test'
    fill_in 'event[date]', with: '2020-07-20'
    click_on 'Create Event'
    user1 = User.find(1)
    expect(user1.events.first.description).to include('event_test')
  end
end
