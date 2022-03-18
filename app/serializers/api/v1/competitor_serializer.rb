# Competitors serializer
class Api::V1::CompetitorSerializer < ActiveModel::Serializer
  attributes  :id,
              :name,
              :role,
              :results

  def name
    "#{object.first_name} #{object.last_name}"
  end

  def results
    object.results.where(event_id: instance_options[:event_id])
  end
end
