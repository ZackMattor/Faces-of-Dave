class AddActiveToFaces < ActiveRecord::Migration
  def change
    add_column :faces, :active, :boolean, default: true
  end
end
