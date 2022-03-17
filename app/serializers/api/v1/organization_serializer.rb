# Organizations serializer
class Api::V1::OrganizationSerializer < ActiveModel::Serializer
  attributes  :id, 
              :name

  belongs_to :user
end
