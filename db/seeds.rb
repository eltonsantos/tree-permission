# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create admin: true, email: "admin@admin.com", password: "12345678"

Manager.create description: "Prefeitura de Fortaleza"
Manager.create description: "Prefeitura de Natal"

Functionality.create description: "FUNCIONALIDADE 1"
Functionality.create description: "FUNCIONALIDADE 2"
Functionality.create description: "FUNCIONALIDADE 3"
Functionality.create description: "FUNCIONALIDADE 4"

Profile.create description: "PERFIL 1", active: true

ProfileFunctionality.create profile_id: 1, functionality_id: 1
ProfileFunctionality.create profile_id: 1, functionality_id: 2
ProfileFunctionality.create profile_id: 1, functionality_id: 3
ProfileFunctionality.create profile_id: 1, functionality_id: 4