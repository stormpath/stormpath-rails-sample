FactoryGirl.define do
  factory :user do
    email "j.doe@example.com"
    given_name "John"
    surname "Doe"
    username "johndoe"
    password "Password0"
  end

  factory :another_user, class: 'User' do
    email "d.joe@example.com"
    given_name "Don"
    surname "Joe"
    username "donjoe"
    password "Password0"
  end
end