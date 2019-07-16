class AddCursoIdToSolCursos < ActiveRecord::Migration[5.1]
  def change
    add_column :sol_cursos, :curso_id, :integer
  end
end
