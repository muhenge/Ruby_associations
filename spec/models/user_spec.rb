require 'rails_helper'

RSpec.describe User, type: :model do
  before { User.create(username: 'login_user') }

  context 'testing data type' do
    it 'should be a string' do
      user = User.new(username: 'herve')
      user.save
      expect(user.username).to be_an_instance_of(String)
    end
    it 'should not be an integer' do
      user = User.new(username: 'herve')
      user.save
      expect(user.username).not_to be_a(Integer)
    end
  end
  context 'testing instance creation' do
    it 'should create a new instance of User and persist it' do
      user = User.create(username: 'herve')
      expect(user.persisted?).to eql(true)
    end
  end
  context 'Authentification test' do
    let(:visit) do
      scenario 'log_in valid' do
        visit 'http://localhost:3000/sessions/login'
        fill_in 'username', with: 'login_user'
        click_on 'Log in'
        expect(page).to have_content('Welcome:')
      end

      scenario 'log_in invalid' do
        visit 'http://localhost:3000/sessions/login'
        fill_in 'username', with: 'login_wrong'
        click_on 'Log in'
        expect(page).to have_content('Incorrect username')
      end
    end
  end
end
