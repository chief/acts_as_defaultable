FactoryGirl.define do
  factory :td_one, class: TestDefault do
    name 'one'
    default false
  end

  factory :td_two, class: TestDefault do
    name 'two'
    default false
  end
end
