class AddColumntwoToArticles < ActiveRecord::Migration[6.0]
  def change
    add_column :articles, :membersonly, :boolean
  end
end
