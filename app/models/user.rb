class User < ApplicationRecord
  ROLES = {
    user: "user",
    super_admin: "super_admin",
    librarian: "librarian"
  }.freeze

  enum :role, ROLES
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable

  has_many :comments, dependent: :destroy
  has_many :ratings, dependent: :destroy
  has_many :bookings
  has_many :booked_books, through: :bookings, source: :book

  after_initialize :set_default_role, if: :new_record?

  validates :full_name, presence: true
  validates :full_name, length: { minimum: 5, maximum: 30 }

  def confirmed?
    super_admin? || librarian? || confirmed_at.present?
  end

  def locked?
    locked_at.present?
  end

  def active_for_authentication?
    super && !locked?
  end

  def inactive_message
    locked? ? :locked : super
  end

  private

  def set_default_role
    self.role ||= ROLES[:user]
  end
end
