class AddCityToBooks < ActiveRecord::Migration[5.0]
  def change
    add_column :books, :city, :string
  end
end
