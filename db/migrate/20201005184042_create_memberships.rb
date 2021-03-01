class CreateMemberships < ActiveRecord::Migration[6.0]
  def change
    create_table :memberships do |t|
      t.string :name
      t.references :type, null: false, foreign_key: true
      t.string :description
      t.integer :amount

      t.timestamps
    end
  end
end
