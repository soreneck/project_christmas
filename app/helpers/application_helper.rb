module ApplicationHelper
  
  def title
    base_title = "Buru"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end
  
  def logo
    image_tag("logo.gif", :alt => "Buru", :class => "round")
  end
  
end
