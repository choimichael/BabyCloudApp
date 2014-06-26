class AddTitlesAndDescriptionsToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :title, :string
    add_column :posts, :description, :string
  end
end
