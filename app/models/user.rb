class User < ActiveRecord::Base
  authenticates_with_sorcery!

  has_one :token, dependent: :destroy
  has_many :bmi, dependent: :destroy
  has_many :device, dependent: :destroy

  has_many :messages
  has_many :comments

  validates :password, length: {minimum: 6}
  validates :password, confirmation: true
  validates :password_confirmation, presence: true

  validates :email, uniqueness: true
  validates :name, uniqueness: true

    def self.login?(access_token)
        token = Token.find_by_access_token(access_token)
        return false if !token || !token.before_expired? || !token.active
        return !self.find(token.user_id).nil?
    end

    def activate
        if !token
            return Token.create(user_id: self.id)
        else
            if !token.active
                token.set_active
                token.save
            end

            if !token.before_expired?
                token.set_expiration
                token.save
            end
            return token
        end
    end

    def inactivate
        token.active = false
        token.save
    end

    private
        def token
            @token ||= Token.find_by_user_id(self.id)
        end

end         #User Model
