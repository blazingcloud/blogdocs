require 'spec_helper'

describe "/posts/index.html.erb" do
  include PostsHelper
  before(:each) do
    assigns[:posts] = @posts = [
      stub_model(Post,
        :title => "Rails link_to and HTML options",
        :link => "http://millarian.com/programming/ruby-on-rails/rails-link_to-and-html-options/"
      ),
      stub_model(Post,
        :title => "Rails 3 beautiful code",
        :link => "http://blog.envylabs.com/2010/02/rails-3-beautiful-code/"
      )
    ]
  end

  it "renders all posts" do
    render
    
    @posts.each do |post|
      response.should have_selector("a", "href" => post.link) do |a_tag|
        a_tag.should contain post.title
      end 
    end
 
  end
end
