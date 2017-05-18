require 'rails_helper'

RSpec.describe Contact, type: :model do
  it "insert new manager contact" do
    Contact.create! name: 'Marcelo'

    expect(Contact.first.name).to eq('Marcelo')
  end

  it "factory" do
    c = create(:contact)

    expect(c.name).to eq('Carlos')
  end
  
end
