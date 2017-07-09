require 'rails_helper'

RSpec.describe Modifier, type: :model do
	let(:client) {create :client}
	let(:product) {create :product}

	describe '.administrators_cant_have_discounts' do
		context 'when user is administrator' do
			before do
				admin = create :admin
				@modifier = Modifier.find_last_or_build_by user_id: admin.id,
																									 product_id: product.id
			end

			it "should be invalid" do
				expect(@modifier.valid?).to be false
			end

			it 'should return an error on user id' do
				@modifier.valid?
				expect(@modifier.errors[:user_id].size).to eq(1)
			end
		end

		context 'when the user is a client' do
			before do
				client = create :client
				@modifier = Modifier.find_last_or_build_by user_id: client.id,
																									 product_id: product.id
			end

			it 'should be valid' do
				expect(@modifier.valid?).to be true
			end
		end

	end
	
	describe ".get_active_modifier_for" do
		context 'when the user has modifiers' do
			before do
				(1..3).each do |n| 
					create :modifier, user: client,
														product: product,
														created_at: n.days.ago
				end

				@newest = create :modifier, user: client, product: product
			end

			it "should bring the last modifier created" do
				expect(Modifier.get_active_modifier_for client, product).to eq @newest
			end
		end

		context 'when the user has no modifiers' do
			it 'should return nil' do
				expect(Modifier.get_active_modifier_for client, product).to be_nil
			end
		end
	end

	describe '.find_last_or_build_by' do
		before do
			@params = { ammount: 3, product_id: product.id, user_id: client.id }
		end

		context "when there are no matching modifiers" do 
			before do
				@modifier = Modifier.find_last_or_build_by @params
			end

			it 'should return a modifier' do
				expect(@modifier.class).to eq Modifier
			end

			it "should create a new with the given params" do
				expect(@modifier).to have_attributes @params
			end

		end

		context "when there are matching modifiers" do 
			before do
				@newest = Modifier.create @params
			end

			context "and there is only one match" do 
				it 'should return a modifier' do
					expect(@newest.class).to eq Modifier
				end

				it "should bring the match" do
					expect(Modifier.find_last_or_build_by @params).to eq @newest
				end

			end

			context "and there are many matches" do
				before do
					(1..3).each { |n| Modifier.create @params.merge(created_at: n.days.ago) }
					(1..3).each { |n| Modifier.create @params.merge(created_at: n.hours.ago) }
					@modifier = Modifier.find_last_or_build_by @params
				end

				it 'should return a modifier' do
					expect(@modifier.class).to eq Modifier
				end

				it "should bring the last one" do
					expect(@modifier).to eq @newest
				end
			end

		end
	end
end

