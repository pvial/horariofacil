class CreateAsignaturas < ActiveRecord::Migration[5.1]
  def change
    create_table :asignaturas do |t|
      t.integer :colegio_id
      t.integer :ramo_id
      t.string :nombre

      t.timestamps
    end
  end
end
