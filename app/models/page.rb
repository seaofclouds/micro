class Page < ActiveRecord::Base
  validates_presence_of :body
  validates_presence_of :title
  #validates_format_of :title, :with => /^\w+$/, :message => "cannot contain whitespace", :on => :create
  acts_as_textiled :body
  
  
  #def to_param
  #  ("#{title.downcase.gsub(/[^[:alnum:]]/,'_')}".gsub(/_{2,}/,'_')).chomp('_')
  #end
  
end
