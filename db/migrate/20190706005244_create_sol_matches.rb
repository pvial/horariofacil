class CreateSolMatches < ActiveRecord::Migration[5.1]
  def change
    create_table :sol_matches do |t|
      t.integer :asignatura_id
      t.integer :curso_id
      t.integer :profesor_id
      t.integer :solucion_id

      t.timestamps
    end
  end
end
