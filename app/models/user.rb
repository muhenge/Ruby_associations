class User < ApplicationRecord
    has_many :events, foreign_key: "creator_id", class_name: "Event"
    has_many :event_attendings
    has_many :attend, through: :event_attending, source: :event
end
