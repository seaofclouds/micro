ActionController::Routing::Routes.draw do |map|
  map.resources :posts do |post|
    post.resources :comments
  end

  map.resources :tags, :has_many => :posts
  map.root :controller => 'posts'
  
  map.resources :pages
  
  map.login '/login', :controller => 'posts', :action => 'index', :login => 'true'
  map.logout '/logout', :controller => 'sessions', :action => 'destroy'
  
  map.connect '*path', :controller => "static", :action => "notfound"
  
end
