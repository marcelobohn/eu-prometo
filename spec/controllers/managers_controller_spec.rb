require 'rails_helper'

RSpec.describe ManagersController, type: :controller do
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

  describe "POST #index json" do
    it "returns http erro without user" do
      post :index, { :format => :json }
      expect(response).to have_http_status(401)
      expect(response.content_type).to eq('application/json')
    end

    it "returns http success whith user" do
      sign_in user
      post :index, { :format => :json }
      expect(response).to be_success
      expect(response.content_type).to eq('application/json')
    end
  end

  describe "POST #follow" do
    it "returns http success whith user" do
      manager = Manager.create! election: election, name: 'Maria',
        country_id: country.id, state_id: state.id, city_id: city.id,
        type_manager: 0, user: user

      sign_in user
      post :follow, { format: :js, params: { id: manager.id } }

      expect(response).to be_success
      expect(response.content_type).to eq('text/javascript')
      # expect(response.body).to eq("{\"success\":true}")

      manager.reload
      expect(manager.follows.count).to eq(1)
      expect(manager.follows.first.user.name).to eq('admin')
    end
  end
end
