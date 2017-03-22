FactoryGirl.define do
  factory :product do
    name { FFaker::Product.product }
  end
end
