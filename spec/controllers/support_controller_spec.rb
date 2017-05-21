require 'rails_helper'

RSpec.describe SupportController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
      expect(response.content_type).to eq('text/html')
    end
  end

end
