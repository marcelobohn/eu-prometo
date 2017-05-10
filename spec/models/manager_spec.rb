require 'rails_helper'

RSpec.describe Manager, type: :model do
  let(:election) do
    Election.create! year: 2014, type_election: :national
  end
  let(:user) do
    User.create! email: 'admin@euprometoavoce.com.br', password: '123123', password_confirmation: '123123'
  end
  let(:country) do
    Country.create! name: 'Brasil'
  end
  let(:state) do
    State.create! name: 'Rio Grande do Sul', abbrev: 'RS', country: country
  end
  let(:city) do
    City.create! name: 'Ivoti', state: state
  end

  context 'mayor' do
    it "insert new manager of city" do
      manager = Manager.create! election: election, name: 'Maria',
        country_id: country.id, state_id: state.id, city_id: city.id,
        type_manager: :mayor, user: user

      expect(Manager.first.name).to eq('Maria')
    end
  end

  context 'president' do
    it "insert new manager of country" do
      manager = Manager.create! election: election, name: 'Dilma',
        country_id: country.id,
        type_manager: 2, user: user

      expect(Manager.first.name).to eq('Dilma')
      expect(Manager.first.type_manager_text).to eq('Presidente(a)')
    end
  end
end
