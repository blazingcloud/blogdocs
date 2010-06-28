require 'spec_helper'

describe "/posts/edit.html.erb" do
  include PostsHelper

  before(:each) do
    assigns[:post] = @post = mock_model(Post,
        :title => "Rails link_to and HTML options",
        :link => "http://millarian.com/programming/ruby-on-rails/rails-link_to-and-html-options/"
    )                                       
  end

  it "renders edit post form" do
    render

   response.should have_selector("form",
    :method => "post",
    :action => post_path(@post) ) do |form|
      form.should have_selector("input", :type => "submit")
      form.should have_selector("input", :name=> "post[title]")
      form.should have_selector("input", :name=> "post[link]")

    end
  end
  
  it "renders errors" do
    assigns[:post] = mock_model(Post, {
                  :title => "", :link => "",
                  :errors => mock_model(ActiveRecord::Errors,
                      :full_messages => ["An error"],
                      :count => 1) }
                  )

    render

    response.should contain("An error")
  end

end

