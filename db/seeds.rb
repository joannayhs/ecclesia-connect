# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

setup = Team.create(name: "Set Up", description: "Helps set up before the service")
setup.roles.build(title: "Stage Set UP", description: "Helps set up stage before the service", arrival_time: "8:00AM")
setup.save
joanna = User.create(name: "Joanna", email: "joanna@email.com", password: "password")
ian = User.create(name: "Ian", email: "ian@ecclesianj.com", admin: true, password: "password")
band = Team.create(name: "Band", description: "Plays worship music on Sunday morning") 
band.roles.build(title: "Guitar", description: "Plays guitar in the worship band on Sunday mornings", arrival_time: "8:00AM")
band.save 
