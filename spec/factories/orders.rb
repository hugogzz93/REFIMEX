FactoryGirl.define do
  factory :order do
  	user
  	product
  	units { rand(1..100) }
  end
end
