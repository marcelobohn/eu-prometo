require 'rails_helper'

RSpec.describe PromisesController, type: :controller do
  let(:election) {create(:election)}
  let(:user) {create(:user, :admin)}
  let(:country) {create(:country)}
  let(:state) {create(:state, country: country)}
  let(:city) {create(:city, state: state)}

  describe "requests" do
    it "post #index" do
      manager = Manager.create! election: election, name: 'Maria',
        country_id: country.id, state_id: state.id, city_id: city.id,
        type_manager: 0, user: user

      post :index, { params: { manager_id: manager.id } }

      expect(response).to be_success
      expect(response.content_type).to eq('text/html')
    end

    it "get #show" do
      manager = Manager.create! election: election, name: 'Maria',
        country_id: country.id, state_id: state.id, city_id: city.id,
        type_manager: 0, user: user
      promise = manager.promise.create! description: 'promessa um', user: user

      get :show, { format: :html, params: { manager_id: manager.id, id: promise.id } }

      expect(response).to be_success
      expect(response.content_type).to eq('text/html')
    end

    it "get #favorite without authentication" do
      post :favorite, { format: :json, params: { manager_id: 0, id: 0 } }

      json_body = JSON.parse(response.body)

      expect(json_body["error"]).to eq('Para continuar, faça login ou registre-se.')
    end        
    
    it "get #favorite" do
      manager = Manager.create! election: election, name: 'Maria',
        country_id: country.id, state_id: state.id, city_id: city.id,
        type_manager: 0, user: user
      promise = manager.promise.create! description: 'promessa um', user: user

      sign_in user

      post :favorite, { format: :js, params: { manager_id: manager.id, id: promise.id } }

      expect(response).to be_success
      expect(response.content_type).to eq('text/javascript')

      promise.reload
      expect(promise.favorites.count).to eq(1)
      expect(promise.favorites.first.user.name).to eq('admin')
    end
    
    it "post #new" do
      manager = Manager.create! election: election, name: 'Maria',
        country_id: country.id, state_id: state.id, city_id: city.id,
        type_manager: 0, user: user

      sign_in user
      
      post :new, { params: { manager_id: manager.id } }

      expect(response).to be_success
      expect(response.content_type).to eq('text/html')
    end    
  end
end
