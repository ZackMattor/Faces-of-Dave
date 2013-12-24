class FaceSerializer < ActiveModel::Serializer
  attributes :id, :name, :image, :full_image, :translate_x, :translate_y, :scale, :rotation
  
  def image
    object.image.thumb.url
  end

  def full_image
    object.image.url
  end
end
