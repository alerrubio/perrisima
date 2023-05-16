class Client < ApplicationRecord
    validates :name, 
    presence: true,
    format: { with: /\A[^0-9`!@#\$%\^&*+_=]+\z/, message: "Invalid name" }
    validates :phone_number, 
    presence: true, 
    format: { with: /(\A[\d]{10}\z)/ }
end
