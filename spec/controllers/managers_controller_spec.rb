require 'rails_helper'

RSpec.describe ManagersController, type: :controller do
  let(:user) do
    create(:user)
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
end
