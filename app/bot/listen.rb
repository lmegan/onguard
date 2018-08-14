require "facebook/messenger"
include Facebook::Messenger
Facebook::Messenger::Subscriptions.subscribe(access_token: ENV["ACCESS_TOKEN"])
# message.id          # => 'mid.1457764197618:41d102a3e1ae206a38'
# message.sender      # => { 'id' => '1008372609250235' }
# message.sent_at     # => 2016-04-22 21:30:36 +0200
# message.text        # => 'Hello, bot!'
Bot.on :message do |message|
    # Bot.deliver({
  #   recipient: message.sender,
  #   message: {
  # text: 'Human, who is your favorite bot?',
  # quick_replies: [
  #   {
  #     content_type: 'text',
  #     title: 'You are!',
  #     payload: 'HARMLESS'
  #   }
  # ]
  #   }
  # }, access_token: ENV["ACCESS_TOKEN"])

  Bot.deliver({
    recipient: message.sender,
    message: {
      text: answer(message.text)
    }
  }, access_token: ENV["ACCESS_TOKEN"])
end


def answer(text)
  if text == "yo"
   return "sava maggle ?"
  elsif text == "oé et toi frr"
    return "trkl on est al"
  elsif text == "ça fait quoi soirce"
    return "vient on baise des go"
  elsif text == "mdr tu veux baiser qui ?"
    return "jv commencer par ta mère"
  elsif text == "mdr batard"
    return "vazy jte laisse jvé chopé des grammos la"
  else
   return "Idon't undestrant"
  end
end
































