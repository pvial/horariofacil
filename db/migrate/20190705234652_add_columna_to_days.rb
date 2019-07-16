class AddColumnaToDays < ActiveRecord::Migration[5.1]
  def change
    add_column :days, :columna, :integer
  end
end
