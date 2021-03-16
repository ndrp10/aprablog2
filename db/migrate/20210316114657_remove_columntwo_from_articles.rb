class RemoveColumntwoFromArticles < ActiveRecord::Migration[6.0]
  def change
    remove_column :articles, :membersonly, :boolean
  end
end
