class FailOne < ActiveRecord::Base
  acts_as_defaultable :epic, relation: :blog_posts
end
