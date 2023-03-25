class User < ApplicationRecord
  has_many :hosted_events, foreign_key: :host_id, class_name: "Event"

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
