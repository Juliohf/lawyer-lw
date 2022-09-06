class User < ApplicationRecord
  has_many :messages, dependent: :destroy
  has_many :reviews
  has_one_attached :photo
  has_many :lawyer_tags, dependent: :destroy
  has_many :tags, through: :lawyer_tags
  has_many :lawyer_categories, dependent: :destroy
  has_many :categories, through: :lawyer_categories

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
