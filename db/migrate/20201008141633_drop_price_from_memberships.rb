class DropPriceFromMemberships < ActiveRecord::Migration[6.0]
  def change
    remove_column :memberships, :price_cents, :monetize
  end
end
