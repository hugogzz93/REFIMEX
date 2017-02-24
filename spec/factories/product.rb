FactoryGirl.define do
  factory :product do
    base_price { rand 1..10 }
    name { FFaker::Product.product }
    iva 16
    ieps 4.73
  end
end
