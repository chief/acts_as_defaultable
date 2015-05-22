class User < ActiveRecord::Base
  acts_as_defaultable relation: :blog_post
end

