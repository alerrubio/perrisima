class Outcome < ApplicationRecord
  belongs_to :category
  belongs_to :user

  validates :amount,
  presence: true,
  numericality: true

  validates :comment,
  presence: true
  
end
