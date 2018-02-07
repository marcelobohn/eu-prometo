require 'rails_helper'

RSpec.describe "favorites/index.html.erb", type: :view do
  context "acesso simples" do
    it "texto padrão" do
      @favorites = Favorite.all
      render
      expect(rendered).to match /Promessas favoritas/
    end
  end  
end
