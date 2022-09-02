class User < ApplicationRecord
  has_many :messages
  has_many :reviews
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
