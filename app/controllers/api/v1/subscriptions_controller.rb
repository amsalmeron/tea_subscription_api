class Api::V1::SubscriptionsController < ApplicationController
    def index      
        customer = Customer.find_by(id: params["customer_id"])
        render json: SubscriptionSerializer.new(customer.subscriptions)
    end
end