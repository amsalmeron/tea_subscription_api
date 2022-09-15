require 'rails_helper'

RSpec.describe 'Customer Subscription API' do
    it "returns the list of past and present subscriptions for a customer" do
        customer = create(:customer)
        customer_2 = create(:customer)
        subscriptions = create_list(:subscription, 3)
        teas = create_list(:tea, 5)
        CustomerSubscription.create(customer_id: customer.id, subscription_id: subscriptions.first.id)
        CustomerSubscription.create(customer_id: customer.id, subscription_id: subscriptions.third.id)
        CustomerSubscription.create(customer_id: customer_2.id, subscription_id: subscriptions.second.id)

        headers = { "CONTENT_TYPE" => "application/json" }
        get '/api/v1/subscriptions', headers: headers, params: { customer_id: "#{customer.id}" }
        
        
        expect(response).to be_successful
        expect(response).to  have_http_status(200)
        
        response_body = JSON.parse(response.body, symbolize_names: true)
        customer_subscriptions = response_body[:data]

        expect(customer_subscriptions.count).to eq(2) 
        customer_subscriptions.each do |subscription|
            expect(subscription).to have_key(:id)
            expect(subscription).to have_key(:type)
            expect(subscription).to have_key(:attributes)
            expect(subscription[:attributes][:title]).to be_a String
            expect(subscription[:attributes][:status]).to be_in([true, false])
            expect(subscription[:attributes][:price]).to be_a Integer
            expect(subscription[:attributes][:frequency]).to be_a Integer
        end
    end

    it "subscribes a customer to a subscription" do
        customer = create(:customer)
        customer_2 = create(:customer)
        subscriptions = create_list(:subscription, 3)
        teas = create_list(:tea, 5)
        CustomerSubscription.create(customer_id: customer.id, subscription_id: subscriptions.first.id)
        CustomerSubscription.create(customer_id: customer_2.id, subscription_id: subscriptions.second.id)

        post '/api/v1/subscriptions', params: { customer_id: "#{customer.id}", subscription_id: "#{subscriptions.third.id}" }
        
        
        expect(response).to be_successful
        expect(response).to  have_http_status(200)
        
        response_body = JSON.parse(response.body, symbolize_names: true)
        subscription = response_body[:data]
        expect(subscription[:type]).to eq('subscription')
        expect(subscription[:attributes][:status]).to eq(true)
    end
end