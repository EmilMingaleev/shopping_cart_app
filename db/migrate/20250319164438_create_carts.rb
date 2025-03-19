class CreateCarts < ActiveRecord::Migration[8.0]
  def change
    create_table :carts do |t|
      t.decimal :discount

      t.timestamps
    end
  end
end
