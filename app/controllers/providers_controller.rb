# app/controllers/providers_controller.rb

class ProvidersController < ApplicationController
  include ProviderConcern

  def index
    @providers = Provider.all
    @provider = @providers.find(params[:id]) if @providers.present? && params[:id].present?
  end

  def create
    api_response = send_npi_request(provider_params&.dig(:external_id))
    if api_response.dig(:results).empty?
      flash[:notice] = "No Provider found with that NPI number."
      return redirect_to action: 'index'
    end

    @provider = Provider.new(external_id: api_response.dig(:results).first.dig(:number), details: api_response.dig(:results).to_json)
    if @provider.save
      flash[:notice] = "Provider found and saved!"
      return redirect_to providers_path(id: @provider.id)
    else
      flash[:notice] = "#{@provider.external_id} Provider already saved:"
      return redirect_to action: 'index'
    end
  end

  def provider_params
    params.permit(:external_id)
  end
end
