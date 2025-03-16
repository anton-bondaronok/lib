class Author < ApplicationRecord
  has_one_attached :avatar

  validates :full_name, :short_bio, presence: true
end
