require 'rails_helper'

RSpec.describe Tea, type: :model do
    describe "relationships" do
        it { should have_many(:subscription_teas) } 
        it { should have_many(:subscriptions).through(:subscription_teas) } 
        it { should have_many(:customer_subscriptions).through(:subscriptions) } 
        it { should have_many(:customers).through(:customer_subscriptions) } 
    end
end