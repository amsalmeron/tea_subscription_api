class ChangeTableName < ActiveRecord::Migration[5.2]
  def change
    rename_table :subscriptions_teas, :subscription_teas
  end
end
