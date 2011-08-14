module ApplicationHelper
  
  def title
    base_title = "Project Christmas"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end
  
  def logo
    image_tag("logo.gif", :alt => "Project Christmas", :class => "round")
  end
  
end
