class Api::V1::SubscriptionsController < ApplicationController
    def index      
        customer = Customer.find_by(id: params["customer_id"])
        render json: SubscriptionSerializer.new(customer.subscriptions)
    end
    
    def create
        customer = Customer.find_by(id: params["customer_id"])
        subscription = Subscription.find_by(id: params["subscription_id"])
        if !customer.get_subscription_ids.include?(subscription.id)
            customer_subscription = CustomerSubscription.create(customer_id: customer.id, subscription_id: subscription.id, status: true)
        end
        subscription.update(status: true)
        render :json => {
            subscription_active: "#{customer_subscription.status}",
            serializer: SubscriptionSerializer.new(subscription)
        }
    end
    
    def update
        subscription = Subscription.find_by(id: params["subscription_id"])
        customer_subscription = CustomerSubscription.find_by(customer_id: params["customer_id"], subscription_id: params["subscription_id"])
        customer_subscription.toggle(:status)
        customer_subscription.save

        render json: { message: "#{subscription.title} has been cancelled"}
    end
end