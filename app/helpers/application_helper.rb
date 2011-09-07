module ApplicationHelper
  
  def base_title
    "Booroos"
  end
  
  def title
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end
  
  def logo
    image_tag("logo.gif", :alt => base_title, :class => "round")
  end
  
  def link_to_signup
    link_to("Sign up now!", signup_path, :class => "actionLinkButton")
  end
  
end
