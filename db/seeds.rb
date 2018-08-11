<<<<<<< HEAD
=======

>>>>>>> a21ddb20c41d814360d8be6a7c7ee85971a2446c

# # This file should contain all the record creation needed to seed the database with its default values.
# # The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
# #
# # Examples:
# #
# #   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
# #   Character.create(name: 'Luke', movie: movies.first)


# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Event.destroy_all
User.destroy_all
EmergencyContact.destroy_all


user1 = User.create!(first_name: "Lady", last_name: "Gaga", email: "email@email.com", password: "******", phone_number: "087483756234")


event1 = Event.create!(
  name:"event name",
  start_date: Time.now,
  end_date: Time.now - 1.hour,
  location:"the lawn",
  description:"event description",
  user: user1,
  start_time: Time.now,
  end_time: Time.now + 3.hour
)

emergencycontact1 = EmergencyContact.create(first_name: 'hey', last_name: 'ho', phone_number: 'heoo')
emergencycontact2 = EmergencyContact.create(first_name: 'heyy', last_name: 'hoo', phone_number: 'heoooooo')


event_log1 = EventLog.create(date_time: Time.now, description: "some message with details", event: event1)
event_log2 = EventLog.create(date_time: Time.now + 1.hour, description: "more text", event: event1)
event_log3 = EventLog.create(date_time: Time.now, description: "Lorem ipsum dolor sit amet, eu mei elit abhorreant, cibo omnis tempor et eam, at eum meliore aliquando", event: event1)


