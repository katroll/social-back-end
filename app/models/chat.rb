class Chat < ApplicationRecord
  has_many :users 
  has_many :chat_messages
end
