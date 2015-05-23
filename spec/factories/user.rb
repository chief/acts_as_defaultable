FactoryGirl.define do
  factory :user do
    name 'bill'
  end

  factory :user2, class: User do
    name 'chief'
  end
end

