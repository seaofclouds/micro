class AddAuthormetaToPosts < ActiveRecord::Migration
  def self.up
    add_column :posts, :name, :string
    add_column :posts, :email, :string
  end

  def self.down
    remove_column :posts, :email
    remove_column :posts, :name
  end
end
