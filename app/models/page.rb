class Page < ActiveRecord::Base
  validates_presence_of :body
  validates_presence_of :title
  acts_as_textiled :body
  
  
  def permalink
    ("#{title.downcase.gsub(/[^[:alnum:]]/,'_')}".gsub(/_{2,}/,'_')).chomp('_')
  end
  
end
