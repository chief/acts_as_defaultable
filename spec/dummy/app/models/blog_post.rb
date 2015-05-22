class BlogPost < ActiveRecord::Base
  after_destroy User.new, Admin.new
end

