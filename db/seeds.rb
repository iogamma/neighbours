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

## NEIGHBOURHOOD

puts "Finding or Creating Neighbourhood ..."

neigh1 = Neighbourhood.find_or_create_by! strata_title: 'test_neighbourhood'
neigh2 = Neighbourhood.find_or_create_by! strata_title: 'Grand Central'

## BUILDINGS

puts "Re-creating Buildings ..."

Building.destroy_all

build1 = neigh1.buildings.create!({
  name: "Tower1",
  address: Faker::Address.street_address
})

build2 = neigh1.buildings.create!({
  name: "Tower2",
  address: Faker::Address.street_address
})

build3 = neigh2.buildings.create!({
  name: "Tower 1",
  address: "2978 Glen Drive, Coquitlam "
})

build4 = neigh2.buildings.create!({
  name: "Tower 2",
  address: "2968 Glen Drive, Coquitlam"
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

unit3 = build3.units.create!({
  resident_code: '333',
  unit_number: '502'
})

unit4 = build4.units.create!({
  resident_code: '444',
  unit_number: '2508'
})

## USERS

puts "Re-creating Users ..."

User.destroy_all

  for j in 0..20
    user[j] =  unit1.users.create!({
                                    first_name: Faker::Name.first_name,
                                    last_name: Faker::Name.last_name,
                                    email: Faker::Internet.email,
                                    password: Faker::Internet.password(min_length = 8, max_length = 16),
                                    resident_code: '111',
                                    on_council: true
                                  })

    user[j] = unit2.build2[i].create!({
                              first_name: Faker::Name.first_name,
                              last_name: Faker::Name.last_name,
                              email: 'admin@test.com',
                              password: '12345',
                              password_digest: '12345678',
                              resident_code: '111',
                              on_council: true
                            })
  end

byebug

user1 = unit1.users.create!({
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  email: 'admin@test.com',
  password: '12345',
  password_digest: '12345678',
  resident_code: '111',
  on_council: true
})

user2 = unit1.users.create!({
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  email: Faker::Internet.email,
  password: '54321',
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
  description: Faker::Lorem.paragraph(2)
})

user2.assistances.create!({
  neighbourhood_id: 1,
  title: Faker::Hipster.sentence,
  description: Faker::Lorem.paragraph(2)
})

user2.assistances.create!({
  neighbourhood_id: 1,
  title: Faker::Hipster.sentence,
  description: Faker::Lorem.paragraph(2)
})

user2.assistances.create!({
  neighbourhood_id: 1,
  title: Faker::Hipster.sentence,
  description: Faker::Lorem.paragraph(2)
})

user2.assistances.create!({
  neighbourhood_id: 1,
  title: Faker::Hipster.sentence,
  description: Faker::Lorem.paragraph(2)
})

user2.assistances.create!({
  neighbourhood_id: 1,
  title: Faker::Hipster.sentence,
  description: Faker::Lorem.paragraph(2)
})

user2.assistances.create!({
  neighbourhood_id: 1,
  title: Faker::Hipster.sentence,
  description: Faker::Lorem.paragraph(2)
})

user2.assistances.create!({
  neighbourhood_id: 1,
  title: Faker::Hipster.sentence,
  description: Faker::Lorem.paragraph(2)
})

user2.assistances.create!({
  neighbourhood_id: 1,
  title: Faker::Hipster.sentence,
  description: Faker::Lorem.paragraph(2)
})

user2.assistances.create!({
  neighbourhood_id: 1,
  title: Faker::Hipster.sentence,
  description: Faker::Lorem.paragraph(2)
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

# EVENTS COMMENTS

puts "Re-creating Events Comments..."

EventComment.destroy_all

user1.event_comments.create! ({
  content: Faker::Hipster.sentence,
  event_id: 1
})

user2.event_comments.create! ({
  content: Faker::Hipster.sentence,
  event_id: 1
})

user1.event_comments.create! ({
  content: Faker::Hipster.sentence,
  event_id: 2
})

user1.event_comments.create! ({
  content: Faker::Hipster.sentence,
  event_id: 2
})

## ASSISTANCES COMMENTS

puts "Re-creating Assistances Comments..."

AssistanceComment.destroy_all

user1.assistance_comments.create! ({
  content: Faker::Hipster.sentence,
  assistance_id: 1
})

user2.assistance_comments.create! ({
  content: Faker::Hipster.sentence,
  assistance_id: 1
})

user1.assistance_comments.create! ({
  content: Faker::Hipster.sentence,
  assistance_id: 2
})

user1.assistance_comments.create! ({
  content: Faker::Hipster.sentence,
  assistance_id: 2
})

## ATTENDEES

puts "Re-creating Attendees ..."

Attendee.destroy_all

user1.attendees.create! ({
  attend: "yes",
  event_id: 1
})

user2.attendees.create! ({
  attend: "no",
  event_id: 1
})

user2.attendees.create! ({
  attend: "yes",
  event_id: 2
})

# VOTES

puts "Re-creating Votes ..."

Vote.destroy_all

user1.votes.create! ({
  vote: "yes",
  poll_id: 1
})

user2.votes.create! ({
  vote: "no",
  poll_id: 1
})

user2.votes.create! ({
  vote: "yes",
  poll_id: 2
})

puts "DONE!"
