require 'rails_helper'

RSpec.describe Election, type: :model do
  it "insert new elections" do
    e2014 = Election.create! year: 2014, type_election: 0
    e2016 = Election.create! year: 2016, type_election: 1

    expect(Election.first.year).to eq(2014)
    expect(Election.first.type_election).to eq(0)
    expect(Election.first.type_election_text).to eq('Nacional')
    expect(Election.last.year).to eq(2016)
    expect(Election.all.count).to eq(2)
  end
end
