class AddHorasporsemanaToHorasPorSemanas < ActiveRecord::Migration[5.1]
  def change
    add_column :horas_por_semanas, :horasporsemana, :integer
  end
end
