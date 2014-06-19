class AddTitlesToPosts < ActiveRecord::Migration
  def self.up
    change_table :posts do |t|
      t.string :title
    end
  end

  def self.down
    drop_table :posts, :title
  end
end
