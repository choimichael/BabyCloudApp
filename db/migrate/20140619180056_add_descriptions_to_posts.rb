class AddDescriptionsToPosts < ActiveRecord::Migration
  def self.up
    change_table :posts do |t|
      t.string :description 
    end
  end

  def self.down
    drop_table :posts, :description
  end
end
