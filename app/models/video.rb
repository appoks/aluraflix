class Video < ApplicationRecord
  belongs_to :category

  validates :title, :description, presence: true
  validates :url, presence: true, uniqueness: true
end
