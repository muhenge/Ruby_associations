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
end
