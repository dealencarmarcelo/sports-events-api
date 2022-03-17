# Ranking serializer
class Api::V1::RankingSerializer < ActiveModel::Serializer
  attributes  :id,
              :value,
              :unit,
              :position,
              :ranking_type,
              :medal

  belongs_to :user

  def position
    object['position']
  end

  def ranking_type
    type = object.event.active ? Ranking::PARTIAL : Ranking::FINAL
    I18n.t("enumerations.ranking.#{type}")
  end

  def medal
    return unless Medal.list.include? object[:position]

    I18n.t("enumerations.medal.#{Medal.key_for(object[:position])}")
  end
end
