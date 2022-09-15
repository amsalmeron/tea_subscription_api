class AddIdToCustomerSubscriptions < ActiveRecord::Migration[5.2]
  def change
    add_column :customer_subscriptions, :id, :primary_key
  end
end
