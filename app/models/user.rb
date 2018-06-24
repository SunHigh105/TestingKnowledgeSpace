class User < ApplicationRecord
    #ユーザーが削除された時投稿も削除される
    has_many :articles, dependent: :destroy
    # before_save{self.email = email.downcase}
    validates :name, presence: true, length:{maximum: 50}
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true
    validates :email, length:{maximum: 255}, 
              format: { with: VALID_EMAIL_REGEX, message: 'が不正です' },
              uniqueness: true
    has_secure_password
    validates :password, presence: true
    validates :password, length: { minimum: 6 }
end