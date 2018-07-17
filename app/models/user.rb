class User < ApplicationRecord
    attr_accessor :remember_token
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

    # ランダムなトークンを返す
    def User.new_token
        SecureRandom.urlsafe_base64
    end

    # rememberトークンを作成
    def remember
        self.remember_token = User.new_token
        update_attribute(:remember_digest, User.digest(remember_token))
    end

    # 渡されたトークンがダイジェストと一致したらtrueを返す
    def authenticated?(remember_token)
        BCrypt::Password.new(remember_digest).is_password?(remember_token)
    end

    # ユーザーのログイン情報を破棄する
    def forget
        update_attribute(:remember_digest, nil)
    end




end