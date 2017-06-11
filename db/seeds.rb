# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

contractors = Contractor.create(
  [{
    email: 'contractor@c.com',
    password: '12345678',
    password_confirmation: '12345678',
    first_name: 'John',
    last_name: 'Doe',
    company_name: 'ABC Construction',
    address: '123 Main St',
    city: 'Constown',
    state: 'Conststate',
    zip_code: '12345',
    country: 'Constcountry'
    experience: "This is my experience"
  }]
)

requesters = Requester.create(
  [{
    email: 'Requester@r.com',
    password: '12345678',
    password_confirmation: '12345678',
    first_name: 'Jane',
    last_name: 'Doanne'
  }]
)
