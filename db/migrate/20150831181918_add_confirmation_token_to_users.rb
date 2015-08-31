class AddConfirmationTokenToUsers < ActiveRecord::Migration
  def change
    add_index :users, :confirmation_token, unique: true
  end
end
