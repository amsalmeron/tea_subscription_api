require 'rails_helper'

RSpec.describe Customer, type: :model do
    describe "relationships" do
        it { should have_many(:customer_subscriptions) } 
        it { should have_many(:subscriptions).through(:customer_subscriptions) } 
        it { should have_many(:subscription_teas).through(:subscriptions) } 
        it { should have_many(:teas).through(:subscription_teas) } 
    end

    describe "instance methods" do
        it 'returns ids of all subscriptions for a customer' do
            customer = create(:customer)
            subscriptions = create_list(:subscription, 3)
            CustomerSubscription.create(customer_id: customer.id, subscription_id: subscriptions.first.id)
            CustomerSubscription.create(customer_id: customer.id, subscription_id: subscriptions.third.id)
            expect(customer.get_subscription_ids).to eq([subscriptions.first.id,subscriptions.third.id]) 
        end
    end
    
end