class CreateArticleCategoryRelations < ActiveRecord::Migration[5.0]
  def change
    create_table :article_category_relations do |t|
      t.references :article, foreign_key: true
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
