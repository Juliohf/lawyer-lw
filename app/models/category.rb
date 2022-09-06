class Category < ApplicationRecord
  has_many :lawyer_categories, dependent: :destroy
end
