class Like < ApplicationRecord
  # relation
  belongs_to :user
  belongs_to :item

  # validation
  validates :item_id, uniqueness: { scope: :user_id }
end
