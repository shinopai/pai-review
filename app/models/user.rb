class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :name,
            presence: true,
            length: { maximum: 30 }
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # carrierwave
  mount_uploader :user_image, UserImageUploader

  # realtion
  has_many :likes, dependent: :destroy
  has_many :items, through: :likes
  has_many :reviews
end
