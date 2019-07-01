class CreateHorasPorSemanas < ActiveRecord::Migration[5.1]
  def change
    create_table :horas_por_semanas do |t|
      t.integer :curso_id
      t.integer :asignatura_id

      t.timestamps
    end
  end
end
