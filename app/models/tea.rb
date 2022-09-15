class Tea < ApplicationRecord 
    has_many :subscription_teas
    has_many :subscriptions, through: :subscription_teas
    has_many :customer_subscriptions, through: :subscriptions
    has_many :customers, through: :customer_subscriptions
end