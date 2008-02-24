# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  require 'digest/md5'
  include TagsHelper
  
  # Browser Checks
  def mobile_safari?
    request.env["HTTP_USER_AGENT"] && request.env["HTTP_USER_AGENT"][/(Mobile\/.+Safari)/]
  end
  def ie6?
    request.env["HTTP_USER_AGENT"] && request.env["HTTP_USER_AGENT"].include?("MSIE 6")
  end
  def ie7?
    request.env["HTTP_USER_AGENT"] && request.env["HTTP_USER_AGENT"].include?("MSIE 7")
  end
  
  # Generate body id and classes, and also onload if present
  def body_id_and_class
    klass = controller.controller_name + '-' + params[:action]
    klass += " #{@body_class}" if @body_class
    {:id => @body_id, :class => klass, :onload => @onload}
  end
  
  # admin view
  def admin?
    session[:admin]
  end
  
  # formatted dates
  def cascading_date(utc_date)
    diff = Time.now.utc.to_i - utc_date.to_i
    if diff < 3.hours
      distance_of_time_in_words(utc_date, Time.now.utc) + ' ago'
    elsif diff < 24.hours
      "today at #{utc_date.strftime('%l:%M%P')} UTC"
    else
      utc_date.strftime("%d.%b.%Y")
    end
  end
  
  # gravitars
  # require 'digest/md5'
  def gravatar_for(email, size = 30)
    gravatar_id = Digest::MD5.hexdigest(email.to_s.strip)
    image_tag "http://www.gravatar.com/avatar.php?gravatar_id=#{gravatar_id}&size=#{size}&default=#{request.protocol + request.host_with_port}/images/gravatar-default-#{size}.gif", :alt => "gravatar", :class => "avatar logo"
  end
  
  #def textilize_inline(text)
  #  RedCloth.new(text, [:lite_mode]).to_html
  #end

  # title helper
  def title
    if @title
      APP_CONFIG['brand']  + " &raquo; " + @title
    else
      APP_CONFIG['brand'] 
    end
  end
end
