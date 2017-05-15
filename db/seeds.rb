# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Sprint.create(from: 20170512, to: 20170515)
Sprint.create(from: 20170515, to: 20170520)

Goal.create(name: 'first', finished: false, sprint_id: 1)
Goal.create(name: 'two', finished: false, sprint_id: 1)

Goal.create(name: 'three', finished: false, sprint_id: 2)
Goal.create(name: 'four', finished: false, sprint_id: 2)


Day.create(number: 20170512, notes: '')
Task.create(name: 'one', finished: false, day_id: 1)
Task.create(name: 'two', finished: false, day_id: 2)