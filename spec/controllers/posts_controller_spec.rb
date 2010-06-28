require 'spec_helper'

describe PostsController do
    before do
        @post1 = Post.create!(:title => "Validating Nested Attributes on Update",
                             :link => "http://philcrissman.com/2010/04/12/validating-nested-attributes-on-update")
        @post2 = Post.create!(:title => "Pagination in Ruby on Rails",
                             :link => "http://nasir.wordpress.com/2007/10/31/pagination-in-ruby-on-rails-using-will_paginate-plugin/")

        @valid_attributes = {
          "title" => "Something",
          "link" => "http://allaboutrails.com/something-cool-about-rails"
        }
    end
  
    def mock_post(stubs={})
        @mock_post ||= mock_model(Post, stubs)
    end
        
    describe "GET index" do
      it "displays all posts" do
        get :index
        assigns[:posts].should == [@post1, @post2]
        response.should render_template :index
      end    
    end
    
    describe "GET new" do
        it "assigns a new post as @post" do
            Post.stub(:new).and_return(mock_post)
            get :new
            assigns[:post].should equal(mock_post)
        end
    end

    describe "GET edit" do
        it "assigns the requested post as @post" do
          Post.stub(:find).with("37").and_return(mock_post)
          get :edit, :id => "37"
          assigns[:post].should equal(mock_post)
        end
    end
    
    describe "POST create" do

        describe "with valid attributes" do
          before do
            Post.stub(:new).with(@valid_attributes).and_return(mock_post(:save => true))            
          end
          
          it "assigns a newly created post" do
            post :create, :post => @valid_attributes         
            assigns[:post].should equal(mock_post)
          end
          
          it "redirects to the posts page" do
              post :create, :post => @valid_attributes         
              response.should redirect_to(posts_url)
          end

        end
        
        describe "with invalid attributes" do
            before do
                @invalid_attributes = {}
                Post.stub(:new).with(@invalid_attributes).and_return(mock_post(:save => false))            
            end
            
            it "re-render the new page" do
              post :create, :post => @invalid_attributes         
              response.should render_template('new')
          end

        end
    end
  
    describe "PUT update" do
  
      describe "with valid params" do
        it "updates the requested post" do
          Post.should_receive(:find).with("37").and_return(mock_post)
          mock_post.should_receive(:update_attributes).with(@valid_attributes)
          put :update, :id => "37", :post => @valid_attributes
        end
    
        it "redirects to the posts page" do
          Post.stub(:find).and_return(mock_post(:update_attributes => true))
          put :update, :id => "1"
          response.should redirect_to(posts_path)
        end
      end
  
      describe "with invalid params" do
        it "attempts to update the requested post" do
          Post.should_receive(:find).with("37").and_return(mock_post)
          mock_post.should_receive(:update_attributes).with({'title' => nil})
          put :update, :id => "37", :post => {'title' => nil}
        end

  
        it "re-renders the 'edit' template" do
          Post.stub(:find).and_return(mock_post(:update_attributes => false))
          put :update, :id => "1"
          response.should render_template('edit')
        end
      end
  
    end

end
