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

neigh1 = Neighbourhood.find_or_create_by! strata_title: 'BCS4285S - Oasis'
neigh2 = Neighbourhood.find_or_create_by! strata_title: 'BCS3948S - Grand Central'

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

# Unit specific variables
units1 = []
units2 = []

# Generate resident codes
for i in 0..300
  res_code = Unit.generate_code(6)
  unit_num = ((i / 8).floor + 1) * 100 + (i % 9)
  units1 <<  build1.units.create!({
     resident_code: res_code,
     unit_number: unit_num
  })
end

for i in 0..300
  res_code = Unit.generate_code(6)
  unit_num = ((i / 8).floor + 1) * 100 + (i % 9)
  units2 <<  build2.units.create!({
     resident_code: res_code,
     unit_number: unit_num
  })
end

## USERS

puts "Re-creating Users ..."

User.destroy_all

users1 = []
users2 = []

for i in 0..110
  random_unit = rand(300)
  users1[i] =  units1[random_unit].users.create!({  first_name: Faker::Name.first_name,
                                                    last_name: Faker::Name.last_name,
                                                    email: Faker::Internet.email,
                                                    password: "12345",
                                                    resident_code: units1[random_unit].resident_code,
                                                    on_council: Faker::Boolean.boolean(true_ratio = 0.1)
                                                 })
end

for i in 0..110
  random_unit = rand(300)
  users2[i] =  units1[random_unit].users.create!({ first_name: Faker::Name.first_name,
                                                   last_name: Faker::Name.last_name,
                                                   email: Faker::Internet.email,
                                                   password: "12345",
                                                   resident_code: units1[random_unit].resident_code,
                                                   on_council: Faker::Boolean.boolean(true_ratio = 0.1)
                                                })
end

## POLLS

puts "Re-creating Polls ..."

Poll.destroy_all

neigh1.polls.create!({
  user_id: 70,
  email: users1[70].email,
  title: 'Should we buy a new chandalier for the lobby in Tower 1?',
  description: 'The current chandalier will be sold and the money will be used for the purchase of the new one.'
})

neigh1.polls.create!({
  user_id: 7,
  email: users2[7].email,
  title: 'Should we repaint the outdoor walls?',
  description: ''
})

neigh1.polls.create!({
  user_id: 70,
  email: users1[70].email,
  title: 'Should we donate 30 percent of our 2016 budget surplus to charity?',
  description: 'Last year\'s surplus was roughly $10,000, so 30 percent constitutes $3000'
})

## EVENTS

puts 'Re-creating Events ...'

Event.destroy_all

users1[70].events.create!({
  neighbourhood_id: 1,
  title: 'Ask the Strata Council! (Q & A before AGM)',
  description: 'This a chance for folks to ask for clarification in the meeting agenda before the AGM. Two sessions: 1pm - 3pm & 7pm - 9pm',
  date: 'April 8th, 2017',
  location:'Level 5, Conference Room',
  image: open_asset('conference.jpg')
})

users2[1].events.create!({
  neighbourhood_id: 1,
  title: 'Water Aerobics Class',
  description: 'I have spoken with the famous Jimmy Waters and he is willing to teach us three classes if we have more than 10 people interested. Cost: $20 per class.',
  date: 'June 10, 2017',
  location: 'Our Outdoor pool',
  image: open_asset('pool.jpg')
})

users1[2].events.create!({
  neighbourhood_id: 1,
  title: 'Oasis Chess Tournament 2017',
  description: 'Hello neighbours! A few friends and I hold a chess tournament every year. We have 3 spots available in an 8 player single elimination bracket. Anyone interested, we can meet up before then and talk details.',
  date: 'April 28, 2017',
  location: 'Court Yard',
  image: open_asset('chess.jpg')
})

## ASSISTANCES

puts "Re-creating Assistances ..."

Assistance.destroy_all
Notice.destroy_all

users1[rand(100)].assistances.create!({
  neighbourhood_id: 1,
  title: Faker::Hipster.sentence,
  description: Faker::Lorem.paragraph(2)
})
users1[rand(100)].assistances.create!({
 neighbourhood_id: 1,
 title: "Can't get rid of this malware on my PC",
 description: "Hi, I am looking for someone good with computers, and I am willing to pay. Long story short, my PC has something - malware, a virus, something. In my experience with others, a clean install/rebuild is about the only clear solution. I'd rather avoid that due to the Windows 10 install no longer being free.

I have McAfee Multi Access Total Protection (PC) that is free from Cox's Security Suite. Not only did it not prevent the issue from loading, a full scan still shows that there are no issues. I also grabbed Malwarebytes and it, too, states no issues. Both are fully up to date, so this is the most perplexing thing to me. On occasion, Malwarebytes will detect something, but the overall issue still exists.

If I open IE11, the main page is hijacked. It seemingly changes just about every time. MS Edge seems to be functioning normally (meaning I can navigate to other sites and the homepage is not hijacked), but IE is the issue.

The initial site seems to be web-start.org, but the random pages it reroutes me to can be (but not limited to) the following:
* support.techonline.com-security.site
* www.uber.com
* smartnewtab.com
* satisfaction-surveys.org
* ridmiffed.xyz (this site prompts for a Flash Player Update, but it's clearly not from Adobe.)

Now interestingly enough, about 1 out of 5 attempts to open IE will prompt me with McAfee's It's their www.siteadvisor.com site. The latest one it recognized was web-start.org, however it doesn't ALWAYS prompt.

Clearly there's an issue. I'd rather not rebuild for a number of reasons. Any assistance would be greatly appreciated."
})
users1[rand(100)].assistances.create!({
  neighbourhood_id: 1,
  title: Faker::Hipster.sentence,
  description: Faker::Lorem.paragraph(2)
})

users2[rand(100)].assistances.create!({
  neighbourhood_id: 1,
  title: Faker::Hipster.sentence,
  description: Faker::Lorem.paragraph(2)
})

users2[rand(100)].assistances.create!({
  neighbourhood_id: 1,
  title: Faker::Hipster.sentence,
  description: Faker::Lorem.paragraph(2)
})
users1[rand(100)].assistances.create!({
 neighbourhood_id: 1,
 title: "Yahoo Fantasy Hockey Help",
 description: "Forward/Defencemen Stat Categories
Goals- 2points, Assists-2points, +/- = 0.5 points, PPG- 1points, PPA- 1points, SHG- 1points, SHA- 1points, SOG- 0.1points, Hits-0.1points, Blocks- 0.1points

Goaltender Stat Categories
Wins- 3points, Saves- 0.05points, Shutouts- 2points

My Team

J.Benn- E.Kuznetsov- J.Neal
B.Saad- J.Pavelski- K.Palmieri
L.Eriksson- S.Monahan- D.Backes

J.Carlson- D.Byfuglien
R.McDonagh- T.Brodie
OEL- R.Ellis

Luongo
Fleury
Bishop

Bench
Zuccarello
N. Backstrom
R. O'Reilly
D. Pasternak

This is my first time doing a proper fantasy league, with 6 other people, and just wanted some input from everyone on what type of players to pick up, drop, or even trade.

Thankyou "
})
users2[rand(100)].assistances.create!({
  neighbourhood_id: 1,
  title: Faker::Hipster.sentence,
  description: Faker::Lorem.paragraph(2)
})

users1[rand(100)].assistances.create!({
  neighbourhood_id: 1,
  title: Faker::Hipster.sentence,
  description: Faker::Lorem.paragraph(2)
})

users1[rand(100)].assistances.create!({
  neighbourhood_id: 1,
  title: Faker::Hipster.sentence,
  description: Faker::Lorem.paragraph(2)
})

## NOTICES

puts "Re-creating Notices ..."


neigh1.notices.create!({
  user_id: users1[70].id,
  email: users1[70].email,
  title: 'Mailbox Key Collection',
  description: 'Please note that the new mail boxes have now been installed and the keys are available for collection from the onsite Building Managers, Joe or Jack. Please contact them at:
                Jack – 778-555-5555 Joe – 778-777-8888
                A new key will be issued upon presentation of a valid government ID e.g. drivers licence and/or passport. In addition, you will be required to sign-off as an acknowledgement of key receipt.
                Thanking you in advance for your cooperation.',
  date: "March 28, 2017"
})

users2[rand(100)].assistances.create!({
  neighbourhood_id: 1,
  title: Faker::Hipster.sentence,
  description: Faker::Lorem.paragraph(2)
})

neigh1.notices.create!({
  user_id: users2[7].id,
  email: users2[7].email,
  title: "ELEVATOR REPAIRS",
  description: "Please be advised that OTIS will be conducting repairs to elevator #2.
                Therefore, this elevator will not be available for use until further notice.
                Residents will be limited to one elevator during this period, please expect delays.
                We appreciate your understanding and patience and assure you that Council and Management are aiming to conduct all repairs in a timely manner for your convenience.
                Your anticipated cooperation is appreciated.",
  date: "Wednesday, April 5th 2017"
})

users2[rand(100)].assistances.create!({
  neighbourhood_id: 1,
  title: Faker::Hipster.sentence,
  description: Faker::Lorem.paragraph(2)
})

users1[rand(100)].assistances.create!({
  neighbourhood_id: 1,
  title: "I just want to be together - Relationship help",
  description: "Myself and my ex have gone through a lot, we dated for quite some time but towards the end things kept getting in the way and we couldn't be together.
  The decision was his and not mine. For a little while we weren't friends or anything, but after a few months we went back to acting just who we used to when we were together and it was great.
  The thing is because of something I have done in the past is the reason we can't be together, because it causes him to feel bad upon himself and puts in him bad mind sets.
  It is nothing to do with cheating or anything it was around a time I hardly even knew him but it still effects it.
  We dated again but it only lasted for about a month before he couldn't handle it anymore.
  We are still so inlove and I would do anything for us to be together. I often feel guilt and regret.
  The only reason we can't be together is because of my past and it has also messed with his mind.
  I just want to be together but I'm so scared we might never be together again. Any suggestions?"
})

neigh1.notices.create!({
  user_id: users2[7].id,
  email: users2[7],
  title: "INTERCOM SYSTEM OPERATIONAL",
  description: "Please be advised that the intercom system has been restored and is now fully operational. The Strata Council and Management wish to take this opportunity and thank you for your patience with this matter.",
  date: "March 21, 2017"
})
users1[rand(100)].assistances.create!({
 neighbourhood_id: 1,
 title: "Anyone with interior design experience?",
 description: "Hi everyone, we are looking to do a reno for our house and would like to get some consulting on nice designs. Please contact me!"
})
## MEETINGS

puts "Re-creating Meetings ..."

Meeting.destroy_all

meet1 = neigh1.meetings.create!({
  user_id: users1[70].id,
  email: users1[70].email,
  date: "March 28, 2017",
  location: 'Level 5, Conference Room',
  title: 'Council Meeting Minutes for BCS4285S - Oasis'
})

## VIDEOS
puts "Re-creating Videos ..."

Video.destroy_all

meet1.videos.create! ({
  location: 'https://youtu.be/DlLB57T4SLY',
  name: 'AGM 2017'
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

users1[rand(100)].event_comments.create! ({
  content: Faker::Hipster.sentence,
  event_id: 1
})

users2[rand(100)].event_comments.create! ({
  content: Faker::Hipster.sentence,
  event_id: 1
})

users1[rand(100)].event_comments.create! ({
  content: Faker::Hipster.sentence,
  event_id: 2
})

users1[rand(100)].event_comments.create! ({
  content: Faker::Hipster.sentence,
  event_id: 2
})

## ASSISTANCES COMMENTS

puts "Re-creating Assistances Comments..."

AssistanceComment.destroy_all

users1[rand(100)].assistance_comments.create! ({
  content: Faker::Hipster.sentence,
  assistance_id: 1
})

users2[rand(100)].assistance_comments.create! ({
  content: Faker::Hipster.sentence,
  assistance_id: 2
})

users1[rand(100)].assistance_comments.create! ({
  content: Faker::Hipster.sentence,
  assistance_id: 2
})

# MORE ASSISTANCES

puts "Additional assistances"

users1[rand(100)].assistances.create!({
 neighbourhood_id: 1,
 title: "fund raising",
 description: "Hi everyone, my brother recently suffer an odd disease and need to urgently remove this tumor.
  The surgery however cost around 100k, please help our family!!!"
})

users1[rand(100)].assistances.create!({
 neighbourhood_id: 1,
 title: "How do I uninstall the latest Samsung software update?",
 description: "How do I uninstall latest software update. I hate it. Thanks"
})

## ATTENDEES

puts "Re-creating Attendees ..."

Attendee.destroy_all

for i in 0..10
  users1[rand(100)].attendees.create! ({
    attend: "yes",
    event_id: 1
  })
  users2[rand(100)].attendees.create! ({
    attend: "yes",
    event_id: 1
  })
end

for i in 0..1
  users1[rand(100)].attendees.create! ({
    attend: "no",
    event_id: 1
  })
  users2[rand(100)].attendees.create! ({
    attend: "no",
    event_id: 1
  })
end

for i in 0..2
  users1[rand(100)].attendees.create! ({
    attend: "yes",
    event_id: 2
  })
  users2[rand(100)].attendees.create! ({
    attend: "yes",
    event_id: 2
  })
end

for i in 0..0
  users1[rand(100)].attendees.create! ({
    attend: "no",
    event_id: 2
  })
  users2[rand(100)].attendees.create! ({
    attend: "no",
    event_id: 2
  })
end

for i in 0..2
  users1[rand(100)].attendees.create! ({
    attend: "yes",
    event_id: 3
  })
  users2[rand(100)].attendees.create! ({
    attend: "yes",
    event_id: 3
  })
end

for i in 0..1
  users1[rand(100)].attendees.create! ({
    attend: "no",
    event_id: 3
  })
  users2[rand(100)].attendees.create! ({
    attend: "no",
    event_id: 3
  })
end

# VOTES

puts 'Re-creating Votes ...'

Vote.destroy_all

for i in 0..9
  users1[rand(100)].votes.create! ({
    vote: 'yes',
    poll_id: 1
  })
  users2[rand(100)].votes.create! ({
    vote: 'yes',
    poll_id: 1
  })
end

for i in 0..17
  users1[rand(100)].votes.create! ({
    vote: 'no',
    poll_id: 1
  })
  users2[rand(100)].votes.create! ({
    vote: 'no',
    poll_id: 1
  })
end

for i in 0..27
  users1[rand(100)].votes.create! ({
    vote: 'yes',
    poll_id: 2
  })
  users2[rand(100)].votes.create! ({
    vote: 'yes',
    poll_id: 2
  })
end

for i in 0..9
  users1[rand(100)].votes.create! ({
    vote: 'no',
    poll_id: 2
  })
  users2[rand(100)].votes.create! ({
    vote: 'no',
    poll_id: 2
  })
end

for i in 0..15
  users1[rand(100)].votes.create! ({
    vote: 'yes',
    poll_id: 3
  })
  users2[rand(100)].votes.create! ({
    vote: 'yes',
    poll_id: 3
  })
end

for i in 0..12
  users1[rand(100)].votes.create! ({
    vote: 'no',
    poll_id: 3
  })
  users2[rand(100)].votes.create! ({
    vote: 'no',
    poll_id: 3
  })
end

puts 'DONE!'
