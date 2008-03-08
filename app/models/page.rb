class Page < ActiveRecord::Base
  validates_presence_of :body
  validates_presence_of :title
  validates_uniqueness_of :permalink
  acts_as_textiled :body
  
  def before_save
    if permalink.blank?
      self.permalink = ("#{title.downcase.gsub(/[^[:alnum:]]/,'_')}".gsub(/_{2,}/,'_')).chomp('_')
    else
      self.permalink = ("#{permalink.downcase.gsub(/[^[:alnum:]]/,'_')}".gsub(/_{2,}/,'_')).chomp('_')
    end
  end

  def to_param
   permalink
  end
  
end
