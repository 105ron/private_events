# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(name:  "Rhys",
             email: "rhys@rails.com")
            

99.times do |n|
  name  = Faker::StarWars.character
  email = "example-#{n+1}@private-events.org"
  User.create!(name:  name, email: email)
end

users = User.order(:created_at).take(12)
250.times do
	event = Faker::Commerce.department + " Open day"
  content = Faker::Lorem.sentence(14)
  id_no = rand(1..15)
  date = Faker::Date.between_except(1.year.ago, 1.year.from_now, Date.today)
  Event.create!(name: event, description: content, date: date, user_id: id_no)
end

200.times do
	user = rand(1..10)
	event = rand(1..20)
	Attendee.create(user_id: user, event_id: event) #first 10 users attend first 20 events
end