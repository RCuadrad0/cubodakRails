class AddParamsToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :role, :integer
    add_column :users, :terms, :integer
  end
end
