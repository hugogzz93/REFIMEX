# This will guess the User class
FactoryGirl.define do
  factory :user do
    email { FFaker::Internet.email }
    password "123456"
    credentials :client
  end

  factory :admin, class: User do
      email { FFaker::Internet.email }
      password "123456"
      credentials :admin
    end
end