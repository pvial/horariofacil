class CreateCursos < ActiveRecord::Migration[5.1]
  def change
    create_table :cursos do |t|
      t.integer :colegio_id
      t.integer :profesorjefe_id
      t.string :nombre

      t.timestamps
    end
  end
end
