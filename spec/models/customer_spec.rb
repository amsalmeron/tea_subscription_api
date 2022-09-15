require 'rails_helper'

RSpec.describe Customer, type: :model do
    describe "relationships" do
        it { should have_many(:customer_subscriptions) } 
        it { should have_many(:subscriptions).through(:customer_subscriptions) } 
        it { should have_many(:subscription_teas).through(:subscriptions) } 
        it { should have_many(:teas).through(:subscription_teas) } 
    end
end