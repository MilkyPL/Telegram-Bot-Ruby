#!/usr/bin/env ruby
require 'telegram/bot'

puts "Bot Avviato!"

## CONFIGURATION START ##
token = ''
## CONFIGURATION END ##



Telegram::Bot::Client.run(token) do |bot|
  bot.listen do |message|
        if Time.now.to_i - message.date > 5
            next
        end
		reply = nil
		case message.text
			when /^\/start$/i
				bot.api.send_message(chat_id: message.chat.id, text: "Funziona!", reply_to_message_id: message.message_id) 
			when /^ping$/i
				bot.api.send_message(chat_id: message.chat.id, text: "pong")
					
		end
	end
end

