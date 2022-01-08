class Item < ApplicationRecord
  # relation
    has_many :likes, dependent: :destroy
    has_many :users, through: :likes
    has_many :reviews
end
