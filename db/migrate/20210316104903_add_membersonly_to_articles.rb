class AddMembersonlyToArticles < ActiveRecord::Migration[6.0]
  def change
    add_column :articles, :membersonly, :boolean, default: false
  end
end
