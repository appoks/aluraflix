class Video < ApplicationRecord
  validates :title, :description, presence: true
  validates :url, presence: true, uniqueness: true
end
