class DropAmountFromOrders < ActiveRecord::Migration[6.0]
  def change
    remove_column :orders, :amount_cents, :monetize
  end
end