class Category < ApplicationRecord
    has_many :article_category_relations, dependent: :delete_all
    # 中間テーブルを経由している
    has_many :articles, through: :article_category_relations
end
