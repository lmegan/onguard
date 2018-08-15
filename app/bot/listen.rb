include Facebook::Messenger

Bot.on :message do |message|
  user = User.find_by_sender_id message.sender["id"]
  if user.events.any?
    if user.events.where(status: "active").any?
      if (message.text == "help")
        event = user.active_event
         user.trigger_emergency
      elsif (message.text == "stop")
          message.reply(text: "The bot is shutting down")
          event = user.active_event
          event.status = "close"
          event.save
      else
          event = user.active_event
          EventLog.new(description: message.text, event: event).save
          message.reply(text: "Your info has been stored")
          message.reply(text: "Anything else ?")
      end
    elsif user.events.where(status: "pending").any? && user.first_next_event.start_date <= Time.now
        event = user.first_next_event
        event.status = "active"
        EventLog.new(description: "#{message.text} // The event is now active", event: event).save
        event.save
        message.reply(text: "Hello #{user.first_name}! I'm starting to register your event")
    elsif user.events.where(status: "pending").any? && !(user.first_next_event.start_date < Time.now)
        event = user.first_next_event
        message.reply(text: waiting_for_a_new_event(user, event) )
    elsif user.events.where(status: "close").any?

        message.reply(text: waiting_for_a_new_event(user, event) )
    else
      message.reply(text: "you don't have any event")
    end
  else
    # send loging button
    message.reply(
      attachment: {
        type: 'template',
        payload: {
          template_type: 'button',
          text: 'Please Login!',
          buttons: [
            {
              type: 'account_link',
              url: 'https://718bd6d0.ngrok.io/users/sign_in'
            },
          ]
        }
      }
    )
  end
end

Bot.on :account_linking do |linking|
  user = User.find_by_authentication_token linking.authorization_code
  if user
    user.sender_id = linking.messaging["sender"]["id"]
    user.save
  end
end




def waiting_for_a_new_event(user, event)
 return "Hey #{user.first_name}. Sems like you don't have any event now! Your next event #{event.name} will start #{event.start_date.strftime("%A, %b %d")}"
end








