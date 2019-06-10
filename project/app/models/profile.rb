class Profile < ApplicationRecord
  belongs_to :user
  has_one_attached :profile_img

  validates :city, format: { with: /\A[a-zA-Z]+\z/}
  validates :country, format: { with: /\A[a-zA-Z]+\z/}
end
