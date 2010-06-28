require 'spec_helper'

describe "/posts/new.html.erb" do
  include PostsHelper

  it "renders new post form" do
    assigns[:post] = mock_model(Post, {:title => "", :link => ""}).as_new_record

    render

    response.should have_selector("form",
     :method => "post",
     :action => posts_path ) do |form|
       form.should have_selector("input", :name=> "post[title]")
       form.should have_selector("input", :name=> "post[link]")
       form.should have_selector("input", :type => "submit")
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
