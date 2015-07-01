class Photo < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy
  validates :image, :rpublic, :caption, presence: true
end
