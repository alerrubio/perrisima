class Income < ApplicationRecord
  belongs_to :category
 
  belongs_to :client

  belongs_to :user

  validates :amount,
      presence: true,
      numericality: true

  validates :comment,
  presence: true
      



end
