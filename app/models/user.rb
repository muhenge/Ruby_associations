class User < ApplicationRecord
  has_many :events, foreign_key: 'creator_id', class_name: 'Event'
  has_many :event_attending
  has_many :attend, through: :event_attending, source: :event
  # def self.past_event
  #   where('date < ?', Date.today)
  # end

  # def self.upcoming_event
  #   where('date >= ?', Date.today)
  # end

  scope :previously, -> { where('date < ?', Date.today) }
  scope :upcoming, -> { where('date >= ?', Date.today) }
end
