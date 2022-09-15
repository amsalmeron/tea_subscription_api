class ChangeCustomersSubscriptionsToCustomerSubscriptions < ActiveRecord::Migration[5.2]
  def change
    rename_table :customers_subscriptions, :customer_subscriptions
  end
end
