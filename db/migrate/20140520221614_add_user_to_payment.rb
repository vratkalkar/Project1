class AddUserToPayment < ActiveRecord::Migration
  def change
    add_column :payments, :user_id, :number
  end
end
