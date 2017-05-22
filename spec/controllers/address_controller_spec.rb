require 'rails_helper'

# require 'spec_helper'

RSpec.describe AddressController, type: :controller do
  describe "POST #cities" do
    it "returns http success" do
      post :cities, { :params => { :id => 23 }, :format => :json }
      # expect(response).to have_http_status(:success)
      expect(response).to be_success
      expect(response.content_type).to eq('application/json')
    end

    it "returns http error, needs parameter" do
      expect { post :cities, format: :json }.to raise_error RuntimeError, 'Argumentos faltando na requisição'
    end    
  end
end
