class AddSalaIdToAsignaturas < ActiveRecord::Migration[5.1]
  def change
    add_column :asignaturas, :sala_id, :integer
  end
end
