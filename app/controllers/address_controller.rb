class AddressController < ApplicationController
  def cities
    @cities = City.order(:name).where(state_id: params[:id]).select(:id, :name)
    # @cities = City.limit(10).select(:id, :name)
    render json: @cities    
  end
end
