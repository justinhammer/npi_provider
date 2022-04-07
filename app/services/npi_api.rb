# app/services/npi_api.rb

class NpiApi
  BASE_URL = 'https://npiregistry.cms.hhs.gov/api/'.freeze
  API_VERSION = '2.1'.freeze

  def self.npi_send(method, query: {})
    url = BASE_URL
    json_response = nil

    response = HTTParty.public_send(method, url, query: query.merge('version': API_VERSION))

    begin
      json_response = JSON.parse(response.body, symbolize_names: true) || {}
    rescue StandardError
      raise "Failed to connect to NPI Registry at #{url}"
    end
    json_response
  end
end
