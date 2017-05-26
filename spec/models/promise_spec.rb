require 'rails_helper'

RSpec.describe Promise, type: :model do
  let(:election) do
    create(:election)
  end
  let(:user) do
    create(:user)
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

  context 'validate create' do
    it "create promise" do
      promise = Promise.create! manager:manager, description: 'prometo que ...', user_id: user.id

      expect(promise.get_status[:type]).to eq("Não cumprida")
      expect(promise.get_status[:class]).to eq('label label-warning cursor-default')
      expect(promise.get_status).to eq({type: "Não cumprida", class: 'label label-warning cursor-default'})
    end
  end

  context 'validate finish' do
    it "create promise and finish" do
      promise = Promise.create! manager:manager, description: 'prometo que ...', user_id: user.id
      promise.finish('foi comprido', user.id)
      promise.reload

      expect(promise.get_status[:type]).to eq("Cumprida")
      expect(promise.description_finish).to eq("foi comprido")
      expect(promise.user_finish).to eq(user.id)
    end
  end

  context 'validate contest' do
    it "create promise and finish and contest" do
      promise = Promise.create! manager:manager, description: 'prometo que ...', user_id: user.id
      promise.finish('foi comprido', user.id)
      promise.contest('não foi comprido', user.id)
      promise.reload

      expect(promise.get_status[:type]).to eq("Contestada")
      expect(promise.comments.first.description).to eq("não foi comprido")
    end
  end

end
