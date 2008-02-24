class AddExcerptToPosts < ActiveRecord::Migration
  def self.up
    add_column :posts, :excerpt, :string
  end

  def self.down
    remove_column :posts, :excerpt
  end
end
