# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


5.times do
	Alias.create!(
		name: Faker::Internet.user_name,
		ipad: Faker::Internet.ip_v4_address)
end

aliases = Alias.all

10.times do
	Inscription.create!(
		title: Faker::Lorem.sentence,
		body: Faker::Lorem.paragraph,
		alias: aliases.sample)
end

inscriptions = Inscription.all

20.times do
	Scribble.create!(
		body: Faker::Lorem.paragraph,
		inscription_id: inscriptions.sample.id,
		alias: aliases.sample)
end

scribbles = Scribble.all

puts "#{Alias.count} aliases created"
puts "#{Inscription.count} inscriptions created"
puts "#{Scribble.count} scribbles created"