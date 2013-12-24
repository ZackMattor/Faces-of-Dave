class Face < ActiveRecord::Base
  attr_accessible :description, :image, :name, :translate_x, :translate_y, :scale, :rotation

  mount_uploader :image, FaceUploader

  validates :image, presence: true
end
