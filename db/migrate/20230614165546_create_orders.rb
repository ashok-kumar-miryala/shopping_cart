class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.string :description
      t.string :pay_method

      t.timestamps
    end
  end
end
