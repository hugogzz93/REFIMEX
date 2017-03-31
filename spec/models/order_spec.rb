require 'rails_helper'

RSpec.describe Order, type: :model do
	describe "#register_order" do
		it "should be correct"
	end

	describe "order staticity" do
		context "when the product changes price" do
			it "should have the same price as the one at the time of creation"
		end

		context "when the user's discount changes" do
			it "should have the same discount as the one at the time of creation"
		end
	end
end