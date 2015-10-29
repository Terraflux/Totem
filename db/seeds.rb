# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


10.times do
	Inscription.create!(
		title: Faker::Lorem.sentence,
		body: Faker::Lorem.paragraph)
end

inscriptions = Inscription.all

20.times do
	Scribble.create!(
		body: Faker::Lorem.paragraph,
		inscription_id: inscriptions.sample.id)
end

scribbles = Scribble.all

puts "#{Inscription.count} inscriptions created"
puts "#{Scribble.count} scribbles created"