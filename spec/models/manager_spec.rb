require 'rails_helper'

RSpec.describe Manager, type: :model do
  let(:election) {create(:election)}
  let(:user) {create(:user, :admin)}
  let(:country) {create(:country)}
  let(:state) {create(:state, country: country)}
  let(:city) {create(:city, state: state)}

  context 'mayor' do
    it "insert new manager of city" do
      manager = Manager.create! election: election, name: 'Maria',
        country_id: country.id, state_id: state.id, city_id: city.id,
        type_manager: :mayor, user: user

      expect(Manager.first.name).to eq('Maria')
      expect(Manager.first.type_manager_text).to eq('Prefeito(a)')
      expect(Manager.first.get_local).to eq('Ivoti - RS')
    end
    
    it "try new manager of city without city" do
      manager = Manager.create election: election, name: 'Maria',
        country_id: country.id, state_id: state.id,
        type_manager: :mayor, user: user

      expect(manager.valid?).to be_falsey
      expect(manager.errors['type_manager']).to include('Mayor needs a City')
    end    
  end

  context 'governor' do
    it "insert new manager of country" do
      manager = Manager.create! election: election, name: 'Sartori',
        country_id: country.id, state_id: state.id, type_manager: :governor, user: user

      expect(manager.name).to eq('Sartori')
      expect(Manager.first.type_manager_text).to eq('Governador(a)')
      expect(Manager.first.get_local).to eq('Rio Grande do Sul')
    end
  end

  context 'president' do
    it "insert new manager of country" do
      manager = Manager.create! election: election, name: 'Dilma',
        country_id: country.id, state_id: state.id, type_manager: :president, user: user

      expect(manager.name).to eq('Dilma')
      expect(Manager.first.type_manager_text).to eq('Presidente(a)')
      expect(Manager.first.get_local).to eq('Brasil')
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

  context 'follow' do
    it "create follow" do
      manager = Manager.create! election: election, name: 'Maria',
        country_id: country.id, state_id: state.id, city_id: city.id,
        type_manager: 0, user: user
      manager.start_follow user
      manager.reload

      expect(manager.follows.count).to eq(1)
      expect(manager.following? user).to be_truthy
    end
  end
end
