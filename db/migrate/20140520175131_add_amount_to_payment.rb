class AddAmountToPayment < ActiveRecord::Migration
  def change
    add_column :payments, :payment, :integer
  end
end
