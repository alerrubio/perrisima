<<<<<<< HEAD
class Client < ApplicationRecord
    validates :name, 
    presence: true,
    format: { with: /\A[^0-9`!@#\$%\^&*+_=]+\z/, message: "Invalid name" }

end
=======
class Client < ApplicationRecord
    validates :name, 
    presence: true,
    format: { with: /\A[^0-9`!@#\$%\^&*+_=]+\z/, message: "Invalid name" }
    validates :phone_number, 
    presence: true, 
    format: { with: /(\A[\d]{10}\z)/ }
end
>>>>>>> 29935e7e9d245752e38869ed1b48ce69436eecad
