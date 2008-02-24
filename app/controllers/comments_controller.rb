class CommentsController < ApplicationController
  before_filter :load_post
  before_filter :requires_authentication, :only => [:edit, :index, :update, :destroy]
  
  # GET /comments
  # GET /comments.xml
  def index
    @comments = @post.comments.find(:all)
  end

  # GET /comments/1
  # GET /comments/1.xml
  def show
    @comment = @post.comments.find(params[:id])
  end

  # GET /comments/new
  # GET /comments/new.xml
  def new
    @comment = @post.comments.build
    @author = cookies[:author]
    @authoremail = cookies[:authoremail]
    @authorurl = cookies[:authorurl]
  end

  # GET /comments/1/edit
  def edit
    @comment = @post.comments.find(params[:id])
    @author = cookies[:author]
    @authoremail = cookies[:authoremail]
    @authorurl = cookies[:authorurl]
  end

  # POST /comments
  # POST /comments.xml
  def create
    if params[:comment][:bacon].blank? || !params[:comment][:body].blank?
      redirect_to :back and return
    end
    params[:comment].merge!(:body => params[:comment].delete(:bacon))
    @comment = @post.comments.build(params[:comment])
    respond_to do |format|
      if @comment.save
        flash[:notice] = 'Comment was successfully created.'
        cookies[:author] = { :value => params[:comment][:author], :expires => 1.year.from_now}
        cookies[:authoremail] = { :value => params[:comment][:authoremail], :expires => 1.year.from_now}
        cookies[:authorurl] = { :value => params[:comment][:authorurl], :expires => 1.year.from_now}
        format.html { redirect_to(@post) }
        format.xml  { render :xml => @comment, :status => :created, :location => @comment }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @comment.errors, :status => :unprocessable_entity }
        @author = cookies[:author]
        @authoremail = cookies[:authoremail]
        @authorurl = cookies[:authorurl]
      end
    end
  end

  # PUT /comments/1
  # PUT /comments/1.xml
  def update
    @comment = @post.comments.find(params[:id])
    params[:comment].merge!(:body => params[:comment].delete(:bacon))
    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        flash[:notice] = 'Comment was successfully updated.'
        format.html { redirect_to(@post) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @comment.errors, :status => :unprocessable_entity }
        @author = cookies[:author]
        @authoremail = cookies[:authoremail]
        @authorurl = cookies[:authorurl]
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.xml
  def destroy
    @comment = @post.comments.find(params[:id])
    @comment.destroy

    respond_to do |format|
      flash[:notice] = 'Comment was deleted.'
      format.html { redirect_to(@post, @comment) }
      format.xml  { head :ok }
    end
  end
  
  def load_post
    @post = Post.find(params[:post_id])
  end
end
