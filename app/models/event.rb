class Event < ApplicationRecord
    belongs_to :creator, class_name: "User"
    has_many :event_attending
    has_many :attendees, through: :event_attending, source: :user

    def self.past
        where('date < ?', Date.today)
    end

    def self.previous
        where('date > ?', Date.today)
    end
end
