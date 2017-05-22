require 'rails_helper'

RSpec.describe Manager, type: :model do
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

  context 'mayor' do
    it "insert new manager of city" do
      manager = Manager.create! election: election, name: 'Maria',
        country_id: country.id, state_id: state.id, city_id: city.id,
        type_manager: 0, user: user

      expect(Manager.first.name).to eq('Maria')
      expect(Manager.first.type_manager_text).to eq('Prefeito(a)')
    end
  end

  context 'president' do
    it "insert new manager of country" do
      manager = Manager.create! election: election, name: 'Dilma',
        country_id: country.id,
        type_manager: 2, user: user

      expect(manager.name).to eq('Dilma')
      expect(Manager.first.type_manager_text).to eq('Presidente(a)')
    end
  end

  context 'search' do
    it "when mayor" do
      manager = Manager.create! election: election, name: 'Maria',
        country_id: country.id, state_id: state.id, city_id: city.id,
        type_manager: 0, user: user

      manager_mayor = Manager.search({type_manager: 0})
      expect(manager_mayor.count).to eq(1)

      manager_mayor = Manager.search({type_manager: 0, text: 'Maria'})
      expect(manager_mayor.count).to eq(1)

      manager_mayor = Manager.search({type_manager: 0, text: 'João'})
      expect(manager_mayor.count).to eq(0)
      
      manager_president = Manager.search({type_manager: 2})
      expect(manager_president.count).to eq(0)
    end
  end
end
