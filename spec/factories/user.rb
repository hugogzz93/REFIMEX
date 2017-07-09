# This will guess the User class
FactoryGirl.define do
  factory :user, aliases: [:client] do
    name { FFaker::Name.name }
    email { FFaker::Internet.email }
    password '12341234'
    credentials :client
  end

  factory :admin, class: User do
    name { FFaker::Name.name }
    email { FFaker::Internet.email }
    password '12341234'
    credentials :admin
  end
end
