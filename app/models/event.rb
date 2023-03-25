class Event < ApplicationRecord
  after_create_commit { broadcast_append_to('events', target: 'events', locals: { event: self}) }
  
  belongs_to :host, class_name: "User"

  validates :title, presence: true
  validates :location, presence: true
end
