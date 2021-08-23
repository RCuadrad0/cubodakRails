class CreateShoppingCarts < ActiveRecord::Migration[6.1]
  def change
    create_table :shopping_carts do |t|
      t.decimal :total_price
      t.belongs_to :user
      t.timestamps
    end
    create_table :shopping_cart_product, id: false do |t|
      t.belongs_to :product
      t.belongs_to :shoping_cart
    end
  end
end
