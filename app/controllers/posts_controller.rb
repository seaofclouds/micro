class PostsController < ApplicationController
  before_filter :adjust_format_for_iphone
  before_filter :requires_authentication, :except => [:show, :index]
  
  # GET /posts
  # GET /posts.xml
  def index
    @olderposts = Post.find :all, :conditions => {:draft => false}, :order => 'created_at DESC', :limit => 12, :offset => 2
    @latestposts = Post.find :all, :conditions => {:draft => false}, :order => 'created_at DESC', :limit => 2
  end

  # GET /posts/1
  # GET /posts/1.xml
  def show
    @post = Post.find(params[:id])
    @author = cookies[:author]
    @authoremail = cookies[:authoremail]
    @authorurl = cookies[:authorurl]
    @comment = Comment.new
  end

  # GET /posts/new
  # GET /posts/new.xml
  def new
    @post = Post.new
    @author = cookies[:author]
    @authoremail = cookies[:authoremail]

  end

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])
    @author = cookies[:author]
    @authoremail = cookies[:authoremail]  
  end

  # POST /posts
  # POST /posts.xml
  def create
    @post = Post.new(params[:post])
    cookies[:author] = { :value => params[:post][:author], :expires => 1.year.from_now}
    cookies[:authoremail] = { :value => params[:post][:authoremail], :expires => 1.year.from_now}
    respond_to do |format|
      if @post.save
        flash[:notice] = 'Post was successfully created.'
        format.html { redirect_to(@post) }
        format.xml  { render :xml => @post, :status => :created, :location => @post }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @post.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /posts/1
  # PUT /posts/1.xml
  def update
    @post = Post.find(params[:id])

    respond_to do |format|
      if @post.update_attributes(params[:post])
        flash[:notice] = 'Post was successfully updated.'
        format.html { redirect_to(@post) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @post.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.xml
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      flash[:notice] = 'Post was deleted.'
      format.html { redirect_to(posts_url) }
      format.xml  { head :ok }
    end
  end

  def adjust_format_for_iphone
    if @mobile_safari
      request.format = :iphone
    end
  end
  
end

