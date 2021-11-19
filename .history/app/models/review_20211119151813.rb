class Review < ApplicationRecord
  belongs_to :booking
  validates :content
end
