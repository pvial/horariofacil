class CreateRamos < ActiveRecord::Migration[5.1]
  def change
    create_table :ramos do |t|
      t.string :nombre

      t.timestamps
    end
  end
end
