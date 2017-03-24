# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts "Seeding Data ..."

# Helper functions
def open_asset(file_name)
  File.open(Rails.root.join('db', 'seed_assets', file_name))
end

# Only run on development (local) instances not on production, etc.
unless Rails.env.development?
  puts "Development seeds only (for now)!"
  exit 0
end

# Let's do this ...

## STRATA

puts "Finding or Creating Neighbourhood ..."

neigh1 = Stratum.find_or_create_by! strata_title: 'test_neighbourhood'

## BUILDINGS
0
puts "Re-creating Buildings ..."

Building.destroy_all

neigh1 = strat1.buildings.create!({
  name:  'Tower1',
  address: Faker::Address.street_address
})

neigh2 = strat1.buildings.create!({
  name:  'Tower2',
  address: Faker::Address.street_address
})

## UNITS

puts "Re-creating Units ..."

Unit.destroy_all

unit1 = build1.units.create!({
  resident_code: '111',
  unit_number: '101'
})

unit2 = build1.units.create!({
  resident_code: '222',
  unit_number: '202'
})

## USERS

puts "Re-creating Users ..."

User.destroy_all

user1 = unit1.users.create!({
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  email: Faker::Internet.email,
  password: '12345678',
  resident_code: '111',
  on_council: true
})

user2 = unit1.users.create!({
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  email: Faker::Internet.email,
  password: '12345678',
  resident_code: '222',
  on_council: false
})

## POLLS

puts "Re-creating Polls ..."

Poll.destroy_all

user1.polls.create!({
  stratum_id: 1,
  title: Faker::Hipster.sentence,
  description: Faker::Lorem.paragraph(2)
})

user1.polls.create!({
  stratum_id: 1,
  title: Faker::Hipster.sentence,
  description: Faker::Lorem.paragraph(2)
})

user1.polls.create!({
  stratum_id: 1,
  title: Faker::Hipster.sentence,
  description: Faker::Lorem.paragraph(2)
})

## EVENTS

puts "Re-creating Events ..."

Event.destroy_all

user1.events.create!({
  title: Faker::Hipster.sentence,
  description: Faker::Lorem.paragraph(2),
  date: Faker::Date.forward(60)
})

user2.events.create!({
  title: Faker::Hipster.sentence,
  description: Faker::Lorem.paragraph(2),
  date: Faker::Date.forward(60)
})

user2.events.create!({
  title: Faker::Hipster.sentence,
  description: Faker::Lorem.paragraph(2),
  date: Faker::Date.forward(60)
})

## ASSISTANCES

puts "Re-creating Assistances ..."

Assistance.destroy_all

user1.assistances.create!({
  title: Faker::Hipster.sentence,
  description: Faker::Lorem.paragraph(2),
  date: Faker::Date.forward(60)
})

user2.assistances.create!({
  title: Faker::Hipster.sentence,
  description: Faker::Lorem.paragraph(2),
  date: Faker::Date.forward(60)
})

user2.assistances.create!({
  title: Faker::Hipster.sentence,
  description: Faker::Lorem.paragraph(2),
  date: Faker::Date.forward(60)
})

## MEETINGS

puts "Re-creating Meetings ..."

Meeting.destroy_all

meet1 = user1.meetings.create!({
  date: Faker::Date.forward(60),
  location: 'Basement',
  title: 'First Meeting',
  neighbourhood_id: 1
})

## VIDEOS

Video.destroy_all

meet1.vidoes.create! ({
  location: open_asset('vidoe.mp4')
  title: 'First Meeting Vid'
})

## DOCUMENTS

Document.destroy_all

meet1.documents.create! ({
  location: open_asset('document.pdf')
  title: 'First Meeting Doc'
})

## COMMENTS EVENTS

puts "Re-creating Comments Events ..."

Comment_Event.destroy_all

user1.comments_events.create! ({
  content: Faker::Hipster.sentence,
  event_id: 1
})

user2.comments_events.create! ({
  content: Faker::Hipster.sentence,
  event_id: 1
})

user1.comments_events.create! ({
  content: Faker::Hipster.sentence,
  event_id: 2
})

user1.comments_events.create! ({
  content: Faker::Hipster.sentence,
  event_id: 2
})

## COMMENTS ASSISTANCES

puts "Re-creating Comments Assistances ..."

Comment_Assistance.destroy_all

user1.comments_assistances.create! ({
  content: Faker::Hipster.sentence,
  event_id: 1
})

user2.comments_assistances.create! ({
  content: Faker::Hipster.sentence,
  event_id: 1
})

user1.comments_assistances.create! ({
  content: Faker::Hipster.sentence,
  event_id: 2
})

user1.comments_assistances.create! ({
  content: Faker::Hipster.sentence,
  event_id: 2
})

puts "DONE!"
