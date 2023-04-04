class Income < ApplicationRecord
  belongs_to :category
  belongs_to :client
  belongs_to :user
end
