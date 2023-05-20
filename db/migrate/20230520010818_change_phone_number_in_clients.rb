class ChangePhoneNumberInClients < ActiveRecord::Migration[7.0]
  def change
    add_index :clients, :phone_number, unique: true
  end
end
