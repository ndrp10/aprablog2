class RemoveColumnFromMemberships < ActiveRecord::Migration[6.0]
  def change
    remove_column :memberships, :amount, :integer
  end
end
