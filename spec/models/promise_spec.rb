require 'rails_helper'

RSpec.describe Promise, type: :model do
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
  let(:manager) do
    Manager.create! election: election, name: 'Maria',
      country_id: country.id, state_id: state.id, city_id: city.id,
      type_manager: :mayor, user: user
  end

  context 'promise open' do
    it "insert new manager of city" do
      promise = Promise.create! manager:manager, description: 'prometo que ...', user_id: user.id

      expect(promise.get_status[:type]).to eq("Aberta")
      expect(promise.get_status[:class]).to eq('label label-warning cursor-default')
      expect(promise.get_status).to eq({type: "Aberta", class: 'label label-warning cursor-default'})
    end
  end

end
