class CreateTienes < ActiveRecord::Migration[5.1]
  def change
    create_table :tienes do |t|
      t.integer :modulo_id
      t.integer :asignatura_id

      t.timestamps
    end
  end
end
