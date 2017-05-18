require 'rails_helper'

RSpec.describe "support/index.html.erb", type: :view do
  context "acesso simples" do

    it "texto padrão" do
      render
      expect(rendered).to match /Apoie esse projeto/
    end
  end  
end
