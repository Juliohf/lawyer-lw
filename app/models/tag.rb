class Tag < ApplicationRecord
  has_many :lawyer_tags, dependent: :destroy
end
