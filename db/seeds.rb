# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

br = Country.create! name: 'Brasil'
rs = State.create! name: 'Rio Grande do Sul', abbrev: 'RS', country: br
ivoti = City.create! name: 'Ivoti', state: rs

marcelo = User.create! email: 'marcelo@bohn.com.br', password: '123123', password_confirmation: '123123'

election = Election.create! year: 2016, type_election: 2, description: 'Normal'

maria = Manager.create! name: 'Maria', election: election, country: br, state: rs, city: ivoti, type_manager: 3, user: marcelo

Promise.create! manager:maria, description: 'prometo que ...'
