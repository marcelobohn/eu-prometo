require 'rails_helper'

RSpec.describe Favorite, type: :model do
  let(:user) do
    create(:user, :admin)
  end
  let(:election) do
    create(:election)
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
  let(:manager) do
    create(:manager, :mayor, election: election, country_id: country.id, state_id: state.id, city_id: city.id, user: user)
  end  
  let(:promise) do
    create(:promise, user: user, manager: manager)
  end  
  
  context '#create' do
    it "by factory" do
      favorite = Favorite.create! promise: promise, user: user

      expect(favorite).to_not be_nil
    end
  end
end
