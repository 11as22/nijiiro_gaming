class ReviewComment < ApplicationRecord
  validates :comment, presence: true,length: { in: 1..30}
  belongs_to :customer
  belongs_to :review
end
