class AddUserImageToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :user_image, :string, after: :encrypted_password
  end
end
