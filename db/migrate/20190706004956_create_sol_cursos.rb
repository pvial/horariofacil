class CreateSolCursos < ActiveRecord::Migration[5.1]
  def change
    create_table :sol_cursos do |t|
      t.integer :solucion_id
      t.integer :posicion
      t.integer :asignatura_id

      t.timestamps
    end
  end
end
