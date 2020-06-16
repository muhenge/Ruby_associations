class Event < ApplicationRecord
    belongs_to :creator, class_name: "User"
    has_many :event_attendings
    has_many :attendees, through: :event_attending, source: :user
end
