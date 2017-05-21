class AddressController < ApplicationController
  def cities
    # @cities = City.where(state_id: params[:id]).select(:id, :name)
    @cities = City.limit(10).select(:id, :name)
    render json: @cities    
    puts 'aqui'+params[:id]
  end
end
