class Chatroom < ApplicationRecord
  has_many :messages, dependent: :destroy
  belongs_to :lawyer, class_name: "User"
  belongs_to :client, class_name: "User"
end
