class AddExternalOtpToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :external_otp, :string
    add_column :users, :external_token, :string
  end
end
