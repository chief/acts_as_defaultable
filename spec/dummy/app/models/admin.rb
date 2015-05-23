class Admin < ActiveRecord::Base
  acts_as_defaultable :main, relation: :blog_post
end

