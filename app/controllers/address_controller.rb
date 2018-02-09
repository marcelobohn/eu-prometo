class AddressController < ApplicationController
  def cities
    raise "Argumentos faltando na requisição" if !params[:id]
    @cities = City.order(:name).where(state_id: params[:id]).select(:id, :name)
    if (params[:needs_manager])
      @cities = @cities.where('cities.id not in (select city_id from managers) ')    
    end
    render json: @cities    
  end
end
