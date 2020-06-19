class Event < ApplicationRecord
  validates :description, presence: true
  validates :date, presence: true
  belongs_to :creator, class_name: 'User'
  has_many :event_attending
  has_many :attendees, through: :event_attending, source: :user
  scope :previously, -> { where('date < ?', Date.today) }
  scope :upcoming, -> { where('date >= ?', Date.today) }
end
