class Outcome < ApplicationRecord
  belongs_to :category
  belongs_to :user

  validates :amount,
  presence: true,
  numericality: true
  
end
