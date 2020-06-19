require 'rails_helper'

RSpec.describe User, type: :model do
  it 'should create a string' do
    user = User.new(username: 'herve')
    user.save
    expect(user.username).to be_an_instance_of(String)
  end
end
