require 'rails_helper'

RSpec.describe Promise, type: :model do
  let(:election) { create(:election) }
  let(:user) { create(:user) }
  let(:user_attributes) { attributes_for(:user) }
  let(:country) { create(:country) }
  let(:state) { create(:state, country: country) }
  let(:city) { create(:city, state: state) }
  let(:manager) { create(:manager, :mayor, election: election, country_id: country.id, state_id: state.id, city_id: city.id, user: user) }

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
      expect(promise.user_finish_email).to eq(user_attributes[:email])      
      expect(promise.user_finish_name).to eq(user_attributes[:name])
      expect(promise.video_link_embed).to be_nil      
    end
  end

  context 'favorite' do
    it "create favorite" do
      promise = Promise.create! manager:manager, description: 'prometo que ...', user_id: user.id
      promise.add_favorite user
      promise.reload

      expect(promise.favorites.count).to eq(1)
      expect(promise.isFavorite?(user)).to be_truthy
    end        
  end
end
