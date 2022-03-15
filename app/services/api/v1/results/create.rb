# Create result service
class Api::V1::Results::Create
  prepend SimpleCommand

  def initialize(params)
    @params = params
  end

  def call
    create_result
  end

  private

  def create_result
    result = Result.new(@params)

    errors.add(result.errors) unless result.save

    result
  end
end
