class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.integer :user_id
      t.integer :article_id
      t.boolean :paid
    end
    add_index :payments, :user_id
    add_index :payments, :article_id
  end
end
