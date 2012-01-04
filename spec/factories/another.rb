FactoryGirl.define do
  factory :another do
    test 'omg'
    unique 0
  end

  factory :other, class: Another do
    test 'omg1'
    unique 1
  end
end
