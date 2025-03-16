class Book < ApplicationRecord
  belongs_to :genre
  belongs_to :author
  has_one_attached :avatar

  validates :name, :description, presence: true
end
