# == Schema Information
#
# Table name: sol_cursos
#
#  id            :integer          not null, primary key
#  solucion_id   :integer
#  posicion      :integer
#  asignatura_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  curso_id      :integer
#

class SolCurso < ApplicationRecord
    belongs_to :solucion
end
