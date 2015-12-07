class DeviceSerializer < ActiveModel::Serializer
  attributes :user_id, :id, :timestamp_on, :timestamp_off
end
