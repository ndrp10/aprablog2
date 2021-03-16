class DropColumnFromArticles < ActiveRecord::Migration[6.0]
  def change
    remove_column :articles, :membersonly, :boolean, default: false
  end
end
