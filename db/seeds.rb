# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'

br = Country.create! name: 'Brasil'

CSV.foreach(::Rails.root.join('db/seed_data/estados.csv'), 'r') do |(cod_ibge, sigla, nome)|
    State.create! name: nome, abbrev: sigla, country: br, ibge: cod_ibge
end    
rs = State.find_by_abbrev('RS')

CSV.foreach(::Rails.root.join('db/seed_data/municipios.csv'), 'r') do |(cod_ibge, nome)|
    City.create! name: nome, state: State.find_by_ibge(cod_ibge[0..1]), ibge: cod_ibge
end

# ivoti = City.create! name: 'Ivoti', state: rs
# novoHamburgo = City.create! name: 'Novo Hamburgo', state: rs
# portoAlegre = City.create! name: 'Porto Alegre', state: rs
ivoti = City.find_by_ibge(4310801) # Ivoti
novoHamburgo = City.find_by_ibge(4313409)
portoAlegre = City.find_by_ibge(4314902)

marcelo = User.create! email: 'marcelo@bohn.com.br', password: '123123', password_confirmation: '123123', admin: true
admin = User.create! email: 'admin@euprometoavoce.com.br', password: '123123', password_confirmation: '123123', admin: true

election2014 = Election.create! year: 2014, type_election: 0, description: 'Normal'
election2016 = Election.create! year: 2016, type_election: 1, description: 'Normal'

# presidente
dilma = Manager.create! name: 'Dilma | Temer', election: election2014, country: br, type_manager: 2, user: marcelo

# governador

CSV.foreach(::Rails.root.join('db/seed_data/governadores.csv'), 'r') do |(estado, nome)|
    Manager.create! name: nome, election: election2014, country: br, state: State.find_by_abbrev(estado), type_manager: 1, user: marcelo
end  
# sartori = Manager.create! name: 'José Ivo Sartori', election: election2014, country: br, state: rs, type_manager: 1, user: marcelo
# pezao = Manager.create! name: 'Luiz Fernando Pezão', election: election2014, country: br, state: rj, type_manager: 1, user: marcelo
# tiao_viana = Manager.create! name: 'Tião Viana', election: election2014, country: br, state: ac, type_manager: 1, user: marcelo
# renan_filho = Manager.create! name: 'Renan Filho', election: election2014, country: br, state: al, type_manager: 1, user: marcelo
# waldez = Manager.create! name: 'Waldez', election: election2014, country: br, state: ap, type_manager: 1, user: marcelo
# eduardo_braga = Manager.create! name: 'Eduardo Braga', election: election2014, country: br, state: am, type_manager: 1, user: marcelo
# rui_costa = Manager.create! name: 'Rui Costa', election: election2014, country: br, state: ba, type_manager: 1, user: marcelo
# camilo = Manager.create! name: 'Camilo', election: election2014, country: br, state: ce, type_manager: 1, user: marcelo
# rollemberg = Manager.create! name: 'Rollemberg', election: election2014, country: br, state: df, type_manager: 1, user: marcelo
# paulo_hartung = Manager.create! name: 'Paulo Hartung', election: election2014, country: br, state: es, type_manager: 1, user: marcelo
# marconi_perillo = Manager.create! name: 'Marconi Perillo', election: election2014, country: br, state: go, type_manager: 1, user: marcelo

# prefeito
maria = Manager.create! name: 'Maria', election: election2016, country: br, state: rs, city: ivoti, type_manager: 0, user: marcelo
fatima_daudt = Manager.create! name: 'Fatima Daudt', election: election2016, country: br, state: rs, city: novoHamburgo, type_manager: 0, user: marcelo
nelson_marchezan_junior = Manager.create! name: 'Nelson Marchezan Junior', election: election2016, country: br, state: rs, city: portoAlegre, type_manager: 0, user: marcelo

Promise.create! manager:maria, description: 'prometo que ...', user: marcelo
