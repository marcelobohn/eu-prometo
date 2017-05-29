require 'rails_helper'

RSpec.describe PromisesController, type: :controller do
  let(:election) do
    create(:election)
  end
  let(:user) do
    create(:user, :admin)
  end
  let(:country) do
    create(:country)
  end
  let(:state) do
      create(:state, country: country)
  end
  let(:city) do
    create(:city, state: state)
  end

  describe "requests" do
    it "post index" do
      manager = Manager.create! election: election, name: 'Maria',
        country_id: country.id, state_id: state.id, city_id: city.id,
        type_manager: 0, user: user

      sign_in user
      post :index, { params: { manager_id: manager.id } }

      expect(response).to be_success
      expect(response.content_type).to eq('text/html')
      # expect(response.body).to eq("{\"success\":true}")
    end

    it "get show" do
      manager = Manager.create! election: election, name: 'Maria',
        country_id: country.id, state_id: state.id, city_id: city.id,
        type_manager: 0, user: user
      promise = manager.promise.create! description: 'promessa um', user: user

      sign_in user
      # get :show, { format: :json, params: { manager_id: manager.id, id: promise.id } }
      get :show, { format: :html, params: { manager_id: manager.id, id: promise.id } }

      expect(response).to be_success
      # expect(response.content_type).to eq('text/html')
      # puts response.body
      # expect(response.body).to eq("{\"success\":true}")
    end

    it "get favorite" do
      manager = Manager.create! election: election, name: 'Maria',
        country_id: country.id, state_id: state.id, city_id: city.id,
        type_manager: 0, user: user
      promise = manager.promise.create! description: 'promessa um', user: user

      sign_in user

      post :favorite, { format: :js, params: { manager_id: manager.id, id: promise.id } }

      expect(response).to be_success
      expect(response.content_type).to eq('text/javascript')
      # puts response.body

      promise.reload
      expect(promise.favorites.count).to eq(1)
      expect(promise.favorites.first.user.name).to eq('admin')
    end
  end
end
