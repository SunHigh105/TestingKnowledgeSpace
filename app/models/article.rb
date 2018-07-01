class Article < ApplicationRecord
    belongs_to :user
    #投稿を新着順に並べる
    # default_scope -> order{(created_at: :desc)}
    # 記事を削除した時に関連するカテゴリも削除される
    has_many :article_category_relations, dependent: :delete_all
    has_many :categories, through: :article_category_relations
    validates :user_id, presence: true
    validates :title, presence: true, length:{maximum: 50}
    validates :content, presence: true, length:{maximum: 1000}
end
