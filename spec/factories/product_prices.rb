FactoryGirl.define do
  factory :product_price do
    valid_quote { rand 1..10 }
    state_quote { rand 1..10 }
    carbon_tax { rand 1..10 }
    final_price { rand 1..10 }
    active_date { Time.zone.now }
    product
  end
end
