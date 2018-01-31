require 'rails_helper'

RSpec.describe "following/index.html.erb", type: :view do
  context "acesso simples" do
    it "texto padrão" do
      render
      expect(rendered).to match /Seguindo gestores/
    end
  end
end
