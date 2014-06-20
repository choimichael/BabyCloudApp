class AddLongitudeToPost < ActiveRecord::Migration
  def change
    add_column :posts, :longitude, :float
  end
end
