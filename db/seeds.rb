# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

br = Country.create! name: 'Brasil'
am = State.create! name: 'Amazonas', abbrev: 'AM', country: br
ac = State.create! name: 'Acre', abbrev: 'AC', country: br
rr = State.create! name: 'Roraima', abbrev: 'RR', country: br
pi = State.create! name: 'Piauí', abbrev: 'PI', country: br
al = State.create! name: 'Alagoas', abbrev: 'AL', country: br
rj = State.create! name: 'Rio de Janeiro', abbrev: 'RJ', country: br
ce = State.create! name: 'Ceará', abbrev: 'CE', country: br
ms = State.create! name: 'Mato Grosso do Sul', abbrev: 'MS', country: br
pa = State.create! name: 'Pará', abbrev: 'PA', country: br
to = State.create! name: 'Tocantins', abbrev: 'TO', country: br
se = State.create! name: 'Sergipe', abbrev: 'SE', country: br
pb = State.create! name: 'Paraíba', abbrev: 'PB', country: br
mg = State.create! name: 'Minas Gerais', abbrev: 'MG', country: br
sc = State.create! name: 'Santa Catarina', abbrev: 'SC', country: br
ap = State.create! name: 'Amapá', abbrev: 'AP', country: br
rn = State.create! name: 'Rio Grande do Norte', abbrev: 'RN', country: br
sp = State.create! name: 'São Paulo', abbrev: 'SP', country: br
ba = State.create! name: 'Bahia', abbrev: 'BA', country: br
pr = State.create! name: 'Paraná', abbrev: 'PR', country: br
go = State.create! name: 'Goiás', abbrev: 'GO', country: br
ro = State.create! name: 'Rondônia', abbrev: 'RO', country: br
mt = State.create! name: 'Mato Grosso', abbrev: 'MT', country: br
df = State.create! name: 'Distrito Federal', abbrev: 'DF', country: br
ma = State.create! name: 'Maranhão', abbrev: 'MA', country: br
pe = State.create! name: 'Pernambuco', abbrev: 'PE', country: br
es = State.create! name: 'Espírito Santo', abbrev: 'ES', country: br
rs = State.create! name: 'Rio Grande do Sul', abbrev: 'RS', country: br

ivoti = City.create! name: 'Ivoti', state: rs

marcelo = User.create! email: 'marcelo@bohn.com.br', password: '123123', password_confirmation: '123123', admin: true
admin = User.create! email: 'admin@euprometoavoce.com.br', password: '123123', password_confirmation: '123123', admin: true

election2014 = Election.create! year: 2014, type_election: 0, description: 'Normal'
election2016 = Election.create! year: 2016, type_election: 1, description: 'Normal'

# presidente
dilma = Manager.create! name: 'Dilma', election: election2014, country: br, type_manager: :president, user: marcelo

# governador
sartori = Manager.create! name: 'José Ivo Sartori', election: election2014, country: br, state: rs, type_manager: :governor, user: marcelo
pezao = Manager.create! name: 'Luiz Fernando Pezão', election: election2014, country: br, state: rj, type_manager: :governor, user: marcelo
tiao_viana = Manager.create! name: 'Tião Viana', election: election2014, country: br, state: ac, type_manager: :governor, user: marcelo
renan_filho = Manager.create! name: 'Renan Filho', election: election2014, country: br, state: al, type_manager: :governor, user: marcelo
waldez = Manager.create! name: 'Waldez', election: election2014, country: br, state: ap, type_manager: :governor, user: marcelo
eduardo_braga = Manager.create! name: 'Eduardo Braga', election: election2014, country: br, state: am, type_manager: :governor, user: marcelo
rui_costa = Manager.create! name: 'Rui Costa', election: election2014, country: br, state: ba, type_manager: :governor, user: marcelo
camilo = Manager.create! name: 'Camilo', election: election2014, country: br, state: ce, type_manager: :governor, user: marcelo
rollemberg = Manager.create! name: 'Rollemberg', election: election2014, country: br, state: df, type_manager: :governor, user: marcelo
paulo_hartung = Manager.create! name: 'Paulo Hartung', election: election2014, country: br, state: es, type_manager: :governor, user: marcelo
marconi_perillo = Manager.create! name: 'Marconi Perillo', election: election2014, country: br, state: go, type_manager: :governor, user: marcelo

# prefeito
maria = Manager.create! name: 'Maria', election: election2016, country: br, state: rs, city: ivoti, type_manager: :mayor, user: marcelo

Promise.create! manager:maria, description: 'prometo que ...', user_create_id: marcelo.id
