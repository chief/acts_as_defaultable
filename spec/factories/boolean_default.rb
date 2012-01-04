FactoryGirl.define do
  factory :boolean_default do
    name 'test'
    default false
  end

  factory :true_boolean_default, class: BooleanDefault do
    name 'test2'
    default true
  end
end
