class EmergencyContact < ApplicationRecord
  belongs_to :user
  has_many :emergency_contact_events, dependent: :destroy
end
