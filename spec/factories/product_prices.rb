FactoryGirl.define do
  factory :product_price do
    fiscal_stimulus { rand 1..10 }
    diminished_quote { rand 1..10 }
    final_price { rand 1..10 }
    active_date { Time.zone.now }
    product
  end
end
