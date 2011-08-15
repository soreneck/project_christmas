require 'spec_helper'

# Specs in this file have access to a helper object that includes
# the PagesHelper. For example:
#
# describe PagesHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       helper.concat_strings("this","that").should == "this that"
#     end
#   end
# end
describe ApplicationHelper do
  #pending "add some examples to (or delete) #{__FILE__}"
  
  describe "title" do
    it "should return base title if view title is missing" do
      helper.title.should == "Buru"
    end

    it "should return base title with view title if available" do
      @title = "Sample"
      helper.title.should == "Buru | Sample"
    end
  end
  
  # describe "logo" do
  #   it "should return logo image tag" do
  #     helper.logo.should have_selector("img", :alt => "Project Christmas", 
  #                                             :class => "round",
  #                                             :src => "/images/logo.gif")
  #   end
  # end
  
end
