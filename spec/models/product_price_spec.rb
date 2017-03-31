require 'rails_helper'

RSpec.describe ProductPrice, type: :model do
  it "should set_change_type before save"
  it "should validate active date can't be in the past"

  describe ".set_change_type" do

  	context "when the product_price is being created" do
			context "when it's the first product_price" do
				it "should be of type both"
			end

			context "when it's not the first product_price" do
				it "should compare to the previous product_price"

				context "and it only modifies tax attributes" do
					it "should be of type tax"
				end

				context "and it only modifies price field" do
					it "should be of type price"
				end
			end

			context "when it's the first product price" do
				context "and it only modifies tax attributes" do
					it "should be of type tax"
				end

				context "and it only modifies price field" do
					it "should be of type price"
				end
			end
  	end
  end

  describe ".determine_change_type" do
  	context "if tax and price changed" do 
  		it "should be of type both"
  	end

  	context "if it was of type both" do
  		it "should be of type both"
  	end

  	context "if tax changed" do 
  		context "and it had a previous price change" do
  			it "should be of type both"
  		end

  		context "and it has no previous price changes" do
	  		it "should be of type tax"
	  	end
  	end

  	context "if price changed" do
  		context "and it had a previous tax change" do
  			it "should be of type both"
  		end

  		context "and it had no previous tax changes" do
	  		it "should be of type price"
  		end
  	end
  end

  describe ".price" do
  	it "should return final price"
  end
end
