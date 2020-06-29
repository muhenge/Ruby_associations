class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true
  has_many :events, foreign_key: 'creator_id', class_name: 'Event'
  has_many :event_attending
  has_many :attend, through: :event_attending, source: :event
end
