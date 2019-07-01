class CreateModulos < ActiveRecord::Migration[5.1]
  def change
    create_table :modulos do |t|
      t.integer :curso_id
      t.integer :dia_id
      t.boolean :activo
      t.integer :posicion

      t.timestamps
    end
  end
end
