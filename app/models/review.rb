class Review < ApplicationRecord
  belongs_to :pub
  validates :content, :rating, presence: true
  validates :rating, inclusion: {in: (1..5).to_a}
  validates :pub_id, presence: true
end
