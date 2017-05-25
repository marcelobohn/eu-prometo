require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  context '#link_to_new' do
    it "link texto padrão" do
      link = link_to_new new_manager_path
      expect(link).to eq("<a class=\"btn btn-success btn-sm\" title=\"Novo\" href=\"/managers/new\"><i class=\"glyphicon glyphicon-plus\"></i> Novo</a>")
      expect(link).to include("<i class=\"glyphicon glyphicon-plus\"></i> Novo</a>")
      expect(link).to include("/managers/new")
    end

    it "link texto especifico" do
      link = link_to_new new_manager_path, {text: "Novo prefeito"}
      expect(link).to include("<i class=\"glyphicon glyphicon-plus\"></i> Novo prefeito</a>")
    end

    it "link texto vindo da tradução" do
      link = link_to_new new_manager_path, {index: 'views.manager.index.new'}
      expect(link).to include("<i class=\"glyphicon glyphicon-plus\"></i> Novo administrador</a>")
    end

    it "link apenas icone" do
      link = link_to_new new_manager_path, {show_text: false}
      expect(link).to include("<i class=\"glyphicon glyphicon-plus\"></i> </a>")
    end
  end
end
