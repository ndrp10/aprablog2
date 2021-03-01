class CreateSubscriptions < ActiveRecord::Migration[6.0]
  def change
    create_table :subscriptions do |t|
      t.text :external_id, null: false, default: ""
      t.belongs_to :user, foreign_key: true, null: false, index: true, type: :bigint
      t.text :status, null: false
      t.boolean :cancel_at_period_end, null: false, default: false
      t.datetime :current_period_start, null: false
      t.datetime :current_period_end, null: false
      t.timestamps null: false
  end

    add_column :users, :stripe_customer_id, :text
    remove_column :users, :stripe_token, :string
  end
end
