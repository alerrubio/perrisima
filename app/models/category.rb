class Category < ApplicationRecord
  validates :name, 
        presence: true,
        format: { with: /\A[^0-9`!@#\$%\^&*+_=]+\z/ }
end
