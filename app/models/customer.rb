class Customer < ApplicationRecord
    has_many :customer_subscriptions
    has_many :subscriptions, through: :customer_subscriptions
    has_many :subscription_teas, through: :subscriptions
    has_many :teas, through: :subscription_teas

    def get_subscription_ids
        subscriptions.map do |subscription|
            subscription.id
        end
    end
end