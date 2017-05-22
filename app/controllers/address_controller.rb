class AddressController < ApplicationController
  def cities
    raise "Argumentos faltando na requisição" if !params[:id]
    @cities = City.order(:name).where(state_id: params[:id]).select(:id, :name)
    if (params[:needs_manager])
      @cities = @cities.joins('FULL JOIN "managers" ON "managers"."city_id" = "cities"."id"').where('managers.city_id is null')    
    end
    render json: @cities    
  end
end
