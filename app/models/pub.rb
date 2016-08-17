class Pub < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :address, presence: true
  has_many :reviews, dependent: :destroy
end
