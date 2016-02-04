class Image < ActiveRecord::Base
  validates :image_url, presence: true
  validates :image_url, uniqueness: true
  # validates :image_url, format: { with: /^https?:/ }

  belongs_to :product
end
