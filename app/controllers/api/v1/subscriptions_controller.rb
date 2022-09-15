class Api::V1::SubscriptionsController < ApplicationController
    def index      
        customer = Customer.find_by(id: params["customer_id"])
        render json: SubscriptionSerializer.new(customer.subscriptions)
    end
    
    def create
        customer = Customer.find_by(id: params["customer_id"])
        subscription = Subscription.find_by(id: params["subscription_id"])
        if !customer.get_subscription_ids.include?(subscription.id)
            CustomerSubscription.create(customer_id: customer.id, subscription_id: subscription.id)
        end
        subscription.update(status: true)
        render json: SubscriptionSerializer.new(subscription)
    end
end