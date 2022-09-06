class LawyerTag < ApplicationRecord
  belongs_to :tag
  belongs_to :user
  validates :tag, uniqueness: { scope: :user }
end
