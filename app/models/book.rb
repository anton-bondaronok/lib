class Book < ApplicationRecord
  belongs_to :genre
  belongs_to :author

  has_many :book_tags, dependent: :destroy
  has_many :tags, through: :book_tags
  accepts_nested_attributes_for :book_tags, reject_if: :all_blank, allow_destroy: true

  has_one_attached :avatar

  validates :name, :description, presence: true

  def available?
    true
  end

  def rating
    4.5
  end
end
