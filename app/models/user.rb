class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :emergency_contacts, dependent: :destroy
  has_many :events, dependent: :destroy
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, uniqueness: true, format: { with: /\A.*@.*\.com\z/ }
  validates :phone_number, presence: true
end

