require 'spec_helper'

describe PostsController do
    before do
      @post1 = Post.create!(:title => "Validating Nested Attributes on Update",
                           :link => "http://philcrissman.com/2010/04/12/validating-nested-attributes-on-update")
      @post2 = Post.create!(:title => "Pagination in Ruby on Rails",
                           :link => "http://nasir.wordpress.com/2007/10/31/pagination-in-ruby-on-rails-using-will_paginate-plugin/")

    end
  
  describe "GET show" do
    it "displays one post" do
      get :show, :id => @post1.id
      assigns[:post].should == @post1
      response.should render_template :show
    end    
  end
  
  describe "GET index" do
    it "displays all posts" do
      get :index
      assigns[:posts].should == [@post1, @post2]
      response.should render_template :index
    end    
  end
  
  describe "POST index" do
    before do
      @valid_attributes = {
        :title => "Something",
        :link => "http://allaboutrails.com/something-cool-about-rails"
      }
    end

  end
end
