FactoryGirl.define do
  factory :modifier do
    user
    product
    ammount { rand 1..100 }
  end
end