class Event < ApplicationRecord
  belongs_to :user
  has_many :emergency_contact_event, dependent: :destroy
end
