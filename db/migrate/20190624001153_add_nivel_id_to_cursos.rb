class AddNivelIdToCursos < ActiveRecord::Migration[5.1]
  def change
    add_column :cursos, :nivel_id, :integer
  end
end
