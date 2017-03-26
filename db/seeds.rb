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

## NEIGHBOURHOOD

puts "Finding or Creating Neighbourhood ..."

neigh1 = Neighbourhood.find_or_create_by! strata_title: 'test_neighbourhood'

## BUILDINGS

puts "Re-creating Buildings ..."

Building.destroy_all

build1 = neigh1.buildings.create!({
  name: 'Tower1',
  address: Faker::Address.street_address
})

build2 = neigh1.buildings.create!({
  name: 'Tower2',
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
  email: 'admin@test.com',
  password_digest: '12345678',
  resident_code: '111',
  on_council: true
})

user2 = unit1.users.create!({
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  email: Faker::Internet.email,
  password_digest: '12345678',
  resident_code: '222',
  on_council: false
})

## POLLS

puts "Re-creating Polls ..."

Poll.destroy_all

neigh1.polls.create!({
  user_id: 1,
  email: 'admin@test.com',
  title: Faker::Hipster.sentence,
  description: Faker::Lorem.paragraph(2)
})

neigh1.polls.create!({
  user_id: 1,
  email: 'admin@test.com',
  title: Faker::Hipster.sentence,
  description: Faker::Lorem.paragraph(2)
})

neigh1.polls.create!({
  user_id: 1,
  email: 'admin@test.com',
  title: Faker::Hipster.sentence,
  description: Faker::Lorem.paragraph(2)
})

## EVENTS

puts "Re-creating Events ..."

Event.destroy_all

user1.events.create!({
  neighbourhood_id: 1,
  title: Faker::Hipster.sentence,
  description: Faker::Lorem.paragraph(2),
  date: Faker::Date.forward(60),
  location:'Front yard',
  image: open_asset('p1.jpg')
})

user2.events.create!({
  neighbourhood_id: 1,
  title: Faker::Hipster.sentence,
  description: Faker::Lorem.paragraph(2),
  date: Faker::Date.forward(60),
  location: 'TBA',
  image: open_asset('p2.jpg')
})

user2.events.create!({
  neighbourhood_id: 1,
  title: Faker::Hipster.sentence,
  description: Faker::Lorem.paragraph(2),
  date: Faker::Date.forward(60),
  location: 'Basement',
  image: open_asset('p3.jpg')
})

## ASSISTANCES

puts "Re-creating Assistances ..."

Assistance.destroy_all

user1.assistances.create!({
  neighbourhood_id: 1,
  title: Faker::Hipster.sentence,
  description: Faker::Lorem.paragraph(2),
  date: Faker::Date.forward(60)
})

user2.assistances.create!({
  neighbourhood_id: 1,
  title: Faker::Hipster.sentence,
  description: Faker::Lorem.paragraph(2),
  date: Faker::Date.forward(60)
})

user2.assistances.create!({
  neighbourhood_id: 1,
  title: Faker::Hipster.sentence,
  description: Faker::Lorem.paragraph(2),
  date: Faker::Date.forward(60)
})

## NOTICES

puts "Re-creating Notices ..."

Notice.destroy_all

neigh1.notices.create!({
  user_id: 1,
  email: 'admin@test.com',
  title: Faker::Hipster.sentence,
  description: Faker::Lorem.paragraph(2),
  date: Faker::Date.forward(60)
})

neigh1.notices.create!({
  user_id: 1,
  email: 'admin@test.com',
  title: Faker::Hipster.sentence,
  description: Faker::Lorem.paragraph(2),
  date: Faker::Date.forward(60)
})

neigh1.notices.create!({
  user_id: 1,
  email: 'admin@test.com',
  title: Faker::Hipster.sentence,
  description: Faker::Lorem.paragraph(2),
  date: Faker::Date.forward(60)
})

## MEETINGS

puts "Re-creating Meetings ..."

Meeting.destroy_all

meet1 = neigh1.meetings.create!({
  user_id: 1,
  email: 'admin@test.com',
  date: Faker::Date.forward(60),
  location: 'Basement',
  title: 'First Meeting'
})

## VIDEOS
puts "Re-creating Videos ..."

Video.destroy_all

meet1.videos.create! ({
  location: open_asset('video.mp4'),
  name: 'First Meeting Vid'
})

## DOCUMENTS
puts "Re-creating documents ..."

Document.destroy_all

meet1.documents.create! ({
  location: open_asset('document.pdf'),
  name: 'First Meeting Doc'
})

# ## COMMENTS EVENTS

# puts "Re-creating Comments Events ..."

# Comments_Event.destroy_all

# user1.comments_events.create! ({
#   content: Faker::Hipster.sentence,
#   event_id: 1
# })

# user2.comments_events.create! ({
#   content: Faker::Hipster.sentence,
#   event_id: 1
# })

# user1.comments_events.create! ({
#   content: Faker::Hipster.sentence,
#   event_id: 2
# })

# user1.comments_events.create! ({
#   content: Faker::Hipster.sentence,
#   event_id: 2
# })

# ## COMMENTS ASSISTANCES

# puts "Re-creating Comments Assistances ..."

# Comments_Assistance.destroy_all

# user1.comments_assistances.create! ({
#   content: Faker::Hipster.sentence,
#   event_id: 1
# })

# user2.comments_assistances.create! ({
#   content: Faker::Hipster.sentence,
#   event_id: 1
# })

# user1.comments_assistances.create! ({
#   content: Faker::Hipster.sentence,
#   event_id: 2
# })

# user1.comments_assistances.create! ({
#   content: Faker::Hipster.sentence,
#   event_id: 2
# })

# ## EVENTS USERS

# puts "Re-creating Events Users ..."

# Events_User.destroy_all

# user1.events_users.create! ({
#   attend: "yes",
#   event_id: 1
# })

# user2.events_users.create! ({
#   attend: "no",
#   event_id: 1
# })

# user2.events_users.create! ({
#   attend: "yes",
#   event_id: 2
# })

## POLLS USERS

# puts "Re-creating Polls Users ..."

# Polls_User.destroy_all

# user1.polls_users.create! ({
#   attend: "yes",
#   event_id: 1
# })

# user2.polls_users.create! ({
#   attend: "no",
#   event_id: 1
# })

# user2.polls_users.create! ({
#   attend: "yes",
#   event_id: 2
# })

puts "DONE!"
