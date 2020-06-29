require 'rails_helper'

RSpec.describe Event, type: :model do
  context 'Event description is always present' do
    it 'is invalid without description input' do
      event = Event.new(description: nil)
      event.valid?
      expect(event.errors[:description]).to include("can't be blank")
    end
  end
  context 'Event date is always present' do
    it 'is invalid without date input' do
      event = Event.new(date: nil)
      event.valid?
      expect(event.errors[:date]).to include("can't be blank")
    end
  end
end
