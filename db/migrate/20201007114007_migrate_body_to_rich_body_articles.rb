class MigrateBodyToRichBodyArticles < ActiveRecord::Migration[6.0]
  def up
    Article.find_each do |article|
      article.update(rich_body: article.content)
    end
  end

  def down
    Article.find_each do |article|
      article.update(content: article.rich_body)
      article.update(rich_body: nil)
    end
  end
end