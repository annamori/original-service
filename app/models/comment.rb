class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :micropost
  mount_uploader :image, ImageUploader
  validates :text, presence: true
end
