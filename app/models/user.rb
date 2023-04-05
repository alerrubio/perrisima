class User < ApplicationRecord
    validates :name, 
        presence: true,
        format: { with: /\A[^0-9`!@#\$%\^&*+_=]+\z/ }
    validates :password, 
        presence: true, 
        format: { with: /\A(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}\z/ }
    validates :email,
        presence: true,
        format: { with: /\A([\w0-9\_\-\.]{1,64}[\@]{1}[a-z]{4,15}[\.]{1}[a-z]{2,3}[\.]{1}[a-z]{2}\z)|([\w0-9\_\-\.]{1,64}[\@]{1}[a-z]{4,15}[\.]{1}[a-z]{3}$)/}
    validates :phone_number, 
        presence: true, 
        format: { with: /(\A[\d]{10}\z)/ }
    validates :user_name, 
        presence: true,
        format: { with: /(\A[a-zA-Z0-9\-_]{3,100}\z)/ }
    validates :user_type,
        presence: true,
        numericality: { only_integer: true, less_than: 2 }
end
