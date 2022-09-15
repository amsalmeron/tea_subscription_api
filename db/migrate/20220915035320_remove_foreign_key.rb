class RemoveForeignKey < ActiveRecord::Migration[5.2]
  def change
      remove_reference :subscriptions, :customer, index: true, foreign_key: true
  end
end
