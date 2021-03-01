class AddColumnToMemberships < ActiveRecord::Migration[6.0]
  def change
    add_column :memberships, :price, :integer
  end
end
