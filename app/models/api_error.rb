# app/models/api_error.rb

class ApiError < StandardError
  attr_reader :error_details

  def initialize(message, error_details)
    super(message)

    @error_details = error_details
  end
end