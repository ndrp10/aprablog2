class AddFieldsToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :name, :string
    add_column :users, :student, :boolean
    add_column :users, :education, :string
    add_column :users, :field_of_study, :string
    add_column :users, :academic_interests, :string
    add_column :users, :expectations, :string
    add_column :users, :member, :boolean
  end
end
