# app/controllers/providers_controller.rb

class ProvidersController < ApplicationController
  include ProviderConcern

  def index
    @providers = Provider.all
    return if @providers.blank?

    @provider = @providers.where(id: params[:id]) if params[:id].present?
    @providers = @providers.sort_by { |provider| [ provider == @provider ? 0 : 1, provider ]  }
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
      redirect_to providers_path(id: @provider.id)
    else
      flash[:notice] = "#{@provider.external_id} Provider already saved:"
      redirect_to providers_path(id: Provider.find_by(external_id: @provider.external_id))
    end
  end

  def show
    @provider = Provider.find(params[:id])
    @pretty_json = JSON.pretty_generate(JSON.parse(@provider.details))
  end

  def provider_params
    params.permit(:external_id)
  end
end
