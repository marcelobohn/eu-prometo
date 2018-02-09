require 'rails_helper'

RSpec.describe AddressController, type: :controller do
  let(:election) {create(:election)}
  let(:user) {create(:user, :admin)}
  let(:country) {create(:country)}
  let(:state) {create(:state, country: country)}
  
  describe "POST #cities" do
    it "returns http success" do
      create(:city, state: state)
      create(:city, name: 'Novo Hamburgo', state: state)

      post :cities, { :params => { :id => state.id }, :format => :json }
      json_body = JSON.parse(response.body)
      
      expect(response).to have_http_status(:success)
      expect(response.content_type).to eq('application/json')
      expect(json_body.size).to eq 2
    end
    
    it "filter cities needs a manager" do
      ivoti = create(:city, state: state)
      create(:city, name: 'Novo Hamburgo', state: state)
      manager = create :manager, election: election,
        country_id: country.id, state_id: state.id, city_id: ivoti.id,
        type_manager: :mayor, user: user      

      
      post :cities, { :params => { :id => state.id, :needs_manager => 'true' }, :format => :json }
      json_body = JSON.parse(response.body)
      
      expect(response).to be_success
      expect(response.content_type).to eq('application/json')
      expect(json_body.size).to eq 1
    end    

    it "returns http error, needs parameter" do
      expect { post :cities, format: :json }.to raise_error RuntimeError, 'Argumentos faltando na requisição'
    end    
  end
end
