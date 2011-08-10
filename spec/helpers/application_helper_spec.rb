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
      helper.title.should == "Project Christmas"
    end

    it "should return base title with view title if available" do
      @title = "Sample"
      helper.title.should == "Project Christmas | Sample"
    end
  end
  
end
