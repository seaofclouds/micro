# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  before_filter :authenticate
  before_filter :load_pages
  before_filter :load_posts
  before_filter :load_comments
  
  
  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => '56f8b0fcf02a90acec2794014f006099'
  
 def authenticate
   return true unless params[:login]
   authenticate_or_request_with_http_basic do |name, pass|
     session[:admin] = name == APP_CONFIG['name'] && pass == APP_CONFIG['pass']
   end
 end
 
 def requires_authentication
   params[:login] = true
   authenticate
 end

 def local_request?
   false
 end
 
 def render_404
   respond_to do |format|
     format.html { render :file => "#{RAILS_ROOT}/app/views/static/notfound.haml", :status => '404 Not Found', :layout=> true }
     format.xml  { render :nothing => true, :status => '404 Not Found' }
   end
   true
 end

 def rescue_action_in_public(e)
   case e when ActiveRecord::RecordNotFound
     render_404
   else
     super
   end
 end

 # for admin header, and comments in footer
 def load_pages
   @pages = Page.find(:all, :order => 'created_at DESC')
 end
 def load_posts
   @posts = Post.find(:all, :conditions => {:draft => false}, :order => 'created_at DESC')
   @draftposts = Post.find :all, :conditions => {:draft => true}, :order => 'created_at DESC'
   @recentposts = Post.find :all, :conditions => {:draft => false}, :order => 'created_at DESC', :limit => 10
 end
 def load_comments
   @recentcomments = Comment.find :all, :order => 'created_at DESC', :limit => 10
 end
 
end
