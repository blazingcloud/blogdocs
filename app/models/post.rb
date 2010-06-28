class Post < ActiveRecord::Base
  validates_presence_of :title, :link
end
