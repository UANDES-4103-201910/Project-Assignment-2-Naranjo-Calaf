class Post < ApplicationRecord
  belongs_to :user
  has_many :attachment
  has_many :comment
  has_many :follow
  has_many :image
  has_many :innapropiate
  has_many :link
  has_many :vote
  has_one :dumpster

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" } #, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  validates :title, presence: true
  validates :description, presence: true

  def self.searchPost(search)
    # Title is for the above case, the OP incorrectly had 'name'
    where("title LIKE ?", "%#{search}%")
  end
  def self.searchPost2(search)
    # Title is for the above case, the OP incorrectly had 'name'
    where("location LIKE ?", "%#{search}%")
  end

end
