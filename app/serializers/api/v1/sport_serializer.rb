# Sports serializer
class Api::V1::SportSerializer < ActiveModel::Serializer
  attributes  :id,
              :name,
              :max_attempts
end
