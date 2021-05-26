class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.belongs_to :user
      t.string :name
      t.string :description
      t.decimal :price
      t.timestamps
    end
  end
end
