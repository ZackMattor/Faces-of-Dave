class Face < ActiveRecord::Base
  attr_accessible :description, :image, :name

  mount_uploader :image, FaceUploader
end
