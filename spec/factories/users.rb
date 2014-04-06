FactoryGirl.define do
  factory :user do
    name 'Test User'
    email 'example@example.com'
    password 'foobar123'
    password_confirmation 'foobar123'
  end
end
