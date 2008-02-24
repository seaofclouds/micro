class Comment < ActiveRecord::Base
  belongs_to :post
  validates_presence_of :author
  validates_format_of :authoremail, :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/, :message => "please check the format of your email address." , :allow_blank => true
  validates_length_of :body, :minimum=>3, :too_short=>"Please enter at least %d characters"
  acts_as_textiled :bacon => :lite_mode, :body => :lite_mode
  validates_each :authorurl, :allow_blank => true , :on => :create do |record, attr, value|
    begin
      uri = URI.parse(value)
      if uri.class != URI::HTTP
        record.errors.add(attr, 'Only HTTP protocol addresses can be used')
      end
    rescue URI::InvalidURIError
      record.errors.add(attr, 'format is not valid.')
    end
  end  

  
  
end
