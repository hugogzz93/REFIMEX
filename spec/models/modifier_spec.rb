require 'rails_helper'

RSpec.describe Modifier, type: :model do

	it "should validate that administrators can't have orders"
	
	describe ".get_active_modifier_for" do
		it "should bring the last modifier created"
	end

	describe '.find_last_or_build_by' do
		context "when there are no matching modifiers" do 
			it "should create a new with the given params"
		end

		context "when there are matching modifiers" do 
			context "and there are multiple matches" do 
				it "should bring the last one"
			end

			context "and there is only one" do 
				it "should bring it"
			end
		end
	end
end

