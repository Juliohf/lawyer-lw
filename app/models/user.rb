class User < ApplicationRecord
  has_many :messages
  has_many :reviews
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  TYPES = ['lawyer', 'client']
  validates :user_type, inclusion: { in: TYPES }

  validates :description
  validates :description, length: { maximum: 150 }
end
