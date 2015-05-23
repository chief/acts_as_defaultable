FactoryGirl.define do
  factory :admin do
    name 'bill'
  end

  factory :admin2, class: Admin do
    name 'chief'
  end
end
