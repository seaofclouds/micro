class AddUsermetaToComments < ActiveRecord::Migration
  def self.up
    add_column :comments, :name, :string
    add_column :comments, :url, :string
  end

  def self.down
    remove_column :comments, :url
    remove_column :comments, :name
  end
end
