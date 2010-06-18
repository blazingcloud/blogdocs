require 'spec_helper'

describe Post do
  describe "creation" do
    before do
      @valid_attributes = {
        :title => "Validating Nested Attributes on Update",
        :link => "http://philcrissman.com/2010/04/12/validating-nested-attributes-on-update"
      }
    end
    
    it "should be valid with valid attributes" do
      person = Post.new(@valid_attributes)
      person.title.should == @valid_attributes[:title]
      person.link.should == @valid_attributes[:link]
      person.should be_valid
    end

    it "should require a title" do
      @invalid = @valid_attributes.dup
      @invalid.delete(:title)
      Post.new(@invalid).should_not be_valid
    end
    
    it "should require a link" do
      @invalid = @valid_attributes.dup
      @invalid.delete(:link)
      Post.new(@invalid).should_not be_valid
    end

  end
end