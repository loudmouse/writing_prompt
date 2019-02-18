class AddArticleCountToPrompts < ActiveRecord::Migration[5.2]
  def change
    add_column :prompts, :article_count, :integer
  end
end
