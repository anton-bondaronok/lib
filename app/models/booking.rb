class Booking < ApplicationRecord
  STATUS = {
    pending: "pending",
    approved: "approved",
    taken: "taken",
    returned: "returned",
    rejected: "rejected"
  }.freeze

  belongs_to :user
  belongs_to :book

  enum status: STATUS

  after_update :set_taken_at, if: -> { taken? && taken_at.blank? }
  after_update :set_returned_at, if: -> { returned? && returned_at.blank? }

  scope :overdue, -> {
    where(status: "taken").where("taken_at IS NOT NULL AND AND taken_at < ?", 14.days.ago.to_date)
  }

  def overdue?
    return false if deadline.blank?

    taken? && deadline < Date.current
  end

  def deadline
    taken_at + 14.days if taken_at.present?
  end

  private

  def set_taken_at
    touch(:taken_at)
  end

  def set_returned_at
    touch(:returned_at)
  end
end
