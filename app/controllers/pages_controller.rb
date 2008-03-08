class PagesController < ApplicationController
  before_filter :requires_authentication, :except => [:show]
  
  # GET /posts
  # GET /posts.xml
  def index
  end

  # GET /posts/1
  # GET /posts/1.xml
  def show
    @page = Page.find(params[:id])
  end

  # GET /posts/new
  # GET /posts/new.xml
  def new
    @page = Page.new
  end

  # GET /posts/1/edit
  def edit
    @page = Page.find(params[:id])
  end

  # POST /posts
  # POST /posts.xml
  def create
    @page = Page.new(params[:page])
    respond_to do |format|
      if @page.save
        flash[:notice] = 'Page was successfully created.'
        format.html { redirect_to(@page) }
        format.xml  { render :xml => @page, :status => :created, :location => @page }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @page.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /posts/1
  # PUT /posts/1.xml
  def update
    @page = Page.find(params[:id])

    respond_to do |format|
      if @page.update_attributes(params[:page])
        flash[:notice] = 'Page was successfully updated.'
        format.html { redirect_to(@page) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @page.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.xml
  def destroy
    @page = Page.find(params[:id])
    @page.destroy

    respond_to do |format|
      flash[:notice] = 'Page was deleted.'
      format.html { redirect_to(pages_url) }
      format.xml  { head :ok }
    end
  end
  
end

