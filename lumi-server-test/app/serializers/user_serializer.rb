class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :name, :activation_state

  has_one :token

end
