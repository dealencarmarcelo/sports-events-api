# Result serializer
class Api::V1::ResultsSerializer < ActiveModel::Serializer
  attributes :id, :value, :unit

  belongs_to :user
  belongs_to :event
end
