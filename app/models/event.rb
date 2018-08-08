class Event < ApplicationRecord
  belongs_to :user
  has_many :emergency_contact_events, dependent: :destroy
  validates :name, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :location, presence: true
  validates :description, presence: true
  validates :user_id, presence: true
end
