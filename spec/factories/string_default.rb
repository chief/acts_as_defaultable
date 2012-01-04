FactoryGirl.define do
  factory :string_default do
    name 'test'
    default 'off'
  end

  factory :true_string_default, class: StringDefault do
    name 'test'
    default 'on'
  end
end
