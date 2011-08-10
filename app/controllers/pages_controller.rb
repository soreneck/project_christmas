class PagesController < ApplicationController

  def about
    init
    @title = "About"
  end

  def contact
    init
    @title = "Contact"
  end

  private
  def init
    @base_title = :"Project Christmas"
  end  

end
