# app/controllers/concerns/provider_concern.rb

module ProviderConcern
  extend ActiveSupport::Concern

  def send_npi_request(external_id)
    json_response = NpiApi.npi_send('get', query: {'number' => external_id})
    return json_response if json_response.dig(:Errors).blank?

    raise ApiError.new("An API Error has occurred", json_response.dig(:Errors))
  end
end