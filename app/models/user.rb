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

  after_initialize :set_default_role, if: :new_record?

  validates :full_name, presence: true
  validates :full_name, length: { minimum: 5, maximum: 30 }

  def confirmed?
    super_admin? || librarian? || confirmed_at.present?
  end

  def locked?
    locked_at.present?
  end

  private

  def set_default_role
    self.role ||= ROLES[:user]
  end
end
