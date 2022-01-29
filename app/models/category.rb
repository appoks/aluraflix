class Category < ApplicationRecord
  has_many :videos

  validates :title, presence: true, uniqueness: true
  validates :color, uniqueness: true
end
