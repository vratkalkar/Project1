class AddAmountToPayment < ActiveRecord::Migration
  def change
    add_column :payments, :payment, :number
  end
end
