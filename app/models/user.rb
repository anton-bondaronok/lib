class User < ApplicationRecord
  ROLES = {
    user: "user",
    super_admin: "super_admin",
    librarian: "librarian"
  }.freeze

  enum :role, ROLES
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable

  after_initialize :set_default_role, if: :new_record?

  validates :full_name, presence: true
  validates :full_name, length: { minimum: 5, maximum: 30 }

  private

  def set_default_role
    self.role ||= ROLES[:user]
  end
end
