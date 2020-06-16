class Event < ApplicationRecord
    belongs_to :creator, class_name: "User"
    has_many :event_attending
    has_many :attendees, through: :event_attending, source: :user

    def self.past_event
        where('date < ?', Date.today)
    end

    def self.upcoming_event
        where('date >= ?', Date.today)
    end

    scope :previously, where('date < ?', Date.today)
    scope :upcoming, where('date >= ?', Date.today)
end
