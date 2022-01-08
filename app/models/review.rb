class Review < ApplicationRecord
  # relation
  belongs_to :user
  belongs_to :item

  # validation
  validates :item_id, uniqueness: { scope: :user_id }
  validates :score,
            presence: true,
            numericality: { only_integer: true }
  validates :body,
            presence: true,
            length: { maximum: 100 }
end
