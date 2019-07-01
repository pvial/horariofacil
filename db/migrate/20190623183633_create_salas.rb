class CreateSalas < ActiveRecord::Migration[5.1]
  def change
    create_table :salas do |t|
      t.integer :colegio_id
      t.integer :disponibilidad

      t.timestamps
    end
  end
end
