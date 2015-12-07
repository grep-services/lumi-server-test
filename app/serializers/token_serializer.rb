class TokenSerializer < ActiveModel::Serializer
  attributes :access_token, :active, :expires_at

end
