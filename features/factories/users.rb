FactoryGirl.define do
  sequence :email do |n|
    "user#{n}.#{rand(100)}@example.com"
  end

  sequence :username do |n|
    "username#{n}.#{rand(100)}"
  end

  factory :user do
    email
    username
    given_name "John"
    surname "Doe"
    password "Password0"
  end

  factory :another_user, class: 'User' do
    email
    username
    given_name "Don"
    surname "Joe"
    password "Password0"
  end
end