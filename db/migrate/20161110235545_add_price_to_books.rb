class AddPriceToBooks < ActiveRecord::Migration[5.0]
  def change
    add_column :books, :price, :string
    add_column :books, :integer, :string
  end
end
