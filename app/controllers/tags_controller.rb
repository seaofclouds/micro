class TagsController < ApplicationController

  def tag_cloud
    @tags = Post.tag_counts
  end
  
  def index
    @tags = Post.tag_counts
  end

  def show
    @tag = Tag.find(params[:id])
    @posts = Post.find_tagged_with(@tag)
  end
  
end
