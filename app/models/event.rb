class Event < ApplicationRecord
  belongs_to :user
  has_many :emergency_contact_events, dependent: :destroy
  validates :name, presence: true
  validates :location, presence: true
  validates :description, presence: true
  validates :user_id, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validate :start_date_must_be_before_the_end_date


def start_date_must_be_before_the_end_date
    if start_date > end_date
      errors.add(:start_date, "must be before an end date!")
    end
  end



end

