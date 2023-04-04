class Event < ApplicationRecord
  after_create_commit { broadcast_append_to('events', target: 'events', locals: { event: self}) }
  
  belongs_to :host, class_name: "User"
  has_many :event_invites, foreign_key: :invited_event_id
  has_many :guests, through: :event_invites, source: :event_guest

  validates :title, presence: true
  validates :location, presence: true

  scope :past_events, -> { where("date < ?", DateTime.now ) }
  scope :upcoming_events, -> { where("date > ?", DateTime.now ) }

end
