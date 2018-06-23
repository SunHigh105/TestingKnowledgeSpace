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
    validates :password, presence: true
    validates :password, length: { minimum: 6 }, allow_nil: true
    has_secure_password
    
    # validate :email_custom_error
    # # validate :password_custom_error

    # def email_custom_error
    #     if email.blank?
    #         errors[:base] = "メールアドレスを入力してください"
    #     elsif email.length > 255
    #         errors[:base] = "メールアドレスは255文字以内で入力してください"
    #     elsif email.match(VALID_EMAIL_REGEX) == nil
    #         errors[:base] = "メールアドレスが不正です"
    #     end
    # end

    # def password_custom_error
    #     if password.blank? || password_confirmation.blank?
    #         errors[:base] = "パスワードを入力してください"
    #     end
    # end

end
