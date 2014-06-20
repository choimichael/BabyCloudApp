class AddLatitudeToPost < ActiveRecord::Migration
  def change
    add_column :posts, :latitude, :float
  end
end
