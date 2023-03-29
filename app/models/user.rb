class User < ApplicationRecord
  has_many :hosted_events, foreign_key: "host_id", class_name: "Event"
  has_many :event_invites, foreign_key: :event_guest_id
  has_many :invited_events, through: :event_invites
  
  validates :name, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
