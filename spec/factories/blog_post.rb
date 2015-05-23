FactoryGirl.define do
  factory :blogPost do
    text 'hello'
  end

  factory :blogPost2, class: BlogPost do
    text 'world'
  end
end

