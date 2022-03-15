# Result list service
class Api::V1::Results::Index
  prepend SimpleCommand

  def call
    fetch_results
  end

  private

  def fetch_results
    Result.order(value: :asc)
  end
end
