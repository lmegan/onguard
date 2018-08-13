class Event < ApplicationRecord
  belongs_to :user
  has_many :emergency_contact_events, dependent: :destroy
  has_many :emergency_contacts, through: :emergency_contact_events
  has_many :event_logs
  validates :name, presence: true
  validates :location, presence: true
  validates :description, presence: true
  validates :user_id, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validate :start_date_must_be_before_the_end_date
  before_create :set_slug
  accepts_nested_attributes_for :emergency_contacts

  def start_date_must_be_before_the_end_date
    if start_date > end_date
      errors.add(:start_date, "must be before an end date!")
    end
  end

  def to_param
    slug
  end

  def set_slug
    loop do  self.slug = SecureRandom.uuid
      break unless Event.where(slug: slug).exists?
    end
  end



end

