require 'rails_helper'

RSpec.describe ManagersController, type: :controller do
  describe "POST #index" do
    fit "returns http success" do
      user = create(:user)  #User.create!(email: "user@example.org", password: "very-secret")
      
      sign_in user

      post :index, { :format => :json }

      # expect(response).to have_http_status(:success)
      expect(response).to be_success

      # expect(response.body).to eq({})
      # puts response.body
      expect(response.content_type).to eq('application/json')
    end
  end
end
