require 'rails_helper'

RSpec.describe AddressController, type: :controller do

  describe "POST #cities" do
    # TODO: teste que retorna erro sem informar id do estado
    
    it "returns http success" do
      post :cities, { :params => { :id => 23 }, :format => :json }

      # expect(response).to have_http_status(:success)
      expect(response).to be_success

      # expect(response.body).to eq({})
      # puts response.body
      expect(response.content_type).to eq('application/json')
    end
  end

end
