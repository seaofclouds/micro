class Post < ActiveRecord::Base
  acts_as_taggable
  validates_presence_of :author
  validates_presence_of :body
  validates_presence_of :title
  validates_format_of :authoremail, :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/, :message => "please check the format of your email address." , :allow_blank => true
  has_many :comments, :order => 'id DESC', :dependent => :delete_all
  
  acts_as_textiled :body, :excerpt
  
  def to_param
    ("#{id}-#{title.downcase.gsub(/[^[:alnum:]]/,'_')}".gsub(/_{2,}/,'_')).chomp('_')
  end
  
end
