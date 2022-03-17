# Event ranking service
class Api::V1::Events::Ranking
  prepend SimpleCommand

  def initialize(event, page, per_page)
    @event = event
    @per_page = per_page
    @offset = (page - 1) * per_page
  end

  def call
    fetch_ranking
  end

  private

  def fetch_ranking
    win_condition = @event.sport&.win_condition

    @event.results
          .select("DISTINCT ON (user_id) results.id, results.value,
              results.unit, results.user_id, results.event_id,
              ROW_NUMBER() OVER(ORDER BY MAX(value) #{win_condition})
              AS position")
          .group('results.id, results.value,
                  results.user_id, results.unit,
                  results.event_id')
          .limit(@per_page)
          .offset(@offset)
  end
end
