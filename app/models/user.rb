class User < ApplicationRecord
  has_many :messages, dependent: :destroy
  has_many :reviews
  has_many :chatrooms_as_lawyer, class_name: "Chatroom", foreign_key: :lawyer_id
  has_many :chatrooms_as_client, class_name: "Chatroom", foreign_key: :client_id
  has_one_attached :photo

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  TYPES = ['lawyer', 'client']
  validates :user_type, inclusion: { in: TYPES }

  validates :description, length: { maximum: 300 }
end
