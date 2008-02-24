class RenameMetaInCommentsAndPosts < ActiveRecord::Migration
  def self.up
    rename_column :comments, :name, :author
    rename_column :comments, :url, :authorurl
    rename_column :comments, :email, :authoremail
    rename_column :posts, :name, :author
    rename_column :posts, :email, :authoremail
  end

  def self.down
    rename_column :comments, :author, :name
    rename_column :comments, :authorurl, :url
    rename_column :comments, :authoremail, :email
    rename_column :posts, :author, :name
    rename_column :posts, :authoremail, :email
  end
end
