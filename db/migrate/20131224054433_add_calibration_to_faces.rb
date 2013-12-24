class AddCalibrationToFaces < ActiveRecord::Migration
  def change
    add_column :faces, :translate_x, :integer, null: false, default: 0
    add_column :faces, :translate_y, :integer, null: false, default: 0
    add_column :faces, :scale, :float, null: false, default: 1
    add_column :faces, :rotation, :integer, null: false, default: 0
  end
end
