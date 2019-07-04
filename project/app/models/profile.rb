class Profile < ApplicationRecord
  belongs_to :user
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "https://seec.colorado.edu/assets/profile-placeholder.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  validates :city, format: { with: /\A[a-zA-Z]+\z/}
  validates :country, format: { with: /\A[a-zA-Z]+\z/}
end
