# app/services/npi_api.rb

class NpiApi
  BASE_URL = 'https://npiregistry.cms.hhs.gov/api/'.freeze

  def self.npi_send(method, query: {})
    url = BASE_URL
    json_response = nil

    response = HTTParty.public_send(method, url, query: query)

    begin
      json_response = JSON.parse(response.body, symbolize_names: true) || {}
    rescue StandardError
      raise "Failed to connect to NPI Registry at #{url}"
    end
    [response_code: response.code, json_response: json_response]
  end
end
