class CreateJoinTableSubscriptionTeas < ActiveRecord::Migration[5.2]
  def change
    create_join_table :teas, :subscriptions do |t|
      t.references :tea, foreign_key: true
      t.references :subscription, foreign_key: true
    end
  end
end
