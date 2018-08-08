
# # This file should contain all the record creation needed to seed the database with its default values.
# # The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
# #
# # Examples:
# #
# #   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
# #   Character.create(name: 'Luke', movie: movies.first)
EmergencyContact.destroy_all


emergencycontact1 = EmergencyContact.create(first_name: 'hey', last_name: 'ho', phone_number: 'heoo')
emergencycontact2 = EmergencyContact.create(first_name: 'heyy', last_name: 'hoo', phone_number: 'heoooooo')


user1 = User.new(first_name: "Lady", last_name: "Gaga", email: "email@email.com", password: "******" phone_number: "087483756234")

event1= Event.new(name:"event name", start_date: Time.now, end_date: Time.now - 1.hour, location:"the lawn", description:"event description", user_id: 1 )


