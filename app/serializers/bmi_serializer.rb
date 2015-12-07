class BmiSerializer < ActiveModel::Serializer
  attributes :user_id, :id, :value, :datetime
end
