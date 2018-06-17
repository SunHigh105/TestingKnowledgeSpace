class Article < ApplicationRecord
    belongs_to :user
    #投稿を新着順に並べる
    # default_scope -> order{(created_at: :desc)}
    validates :user_id, presence: true
    validates :title, presence: true, length:{maximum: 50}
    validates :content, presence: true, length:{maximum: 1000}
end
