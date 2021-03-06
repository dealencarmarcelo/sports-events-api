# Event serializer
class Api::V1::EventSerializer < ActiveModel::Serializer
  attributes  :id,
              :name,
              :start_date,
              :end_date,
              :country,
              :title,
              :active

  belongs_to :organization
  belongs_to :sport

  def title
    "#{object.name} - #{object.start_date.year}"
  end
end
