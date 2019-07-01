# == Schema Information
#
# Table name: horas_por_semanas
#
#  id             :integer          not null, primary key
#  curso_id       :integer
#  asignatura_id  :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  horasporsemana :integer
#

class HorasPorSemana < ApplicationRecord
    belongs_to :curso
    belongs_to :asignatura
end
