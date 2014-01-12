class Face < ActiveRecord::Base
  attr_accessible :description, :image, :name, :translate_x, :translate_y, :scale, :rotation, :active

  mount_uploader :image, FaceUploader
  default_scope { where("active = true") }
  validates :image, presence: true
end
