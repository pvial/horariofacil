# == Schema Information
#
# Table name: sol_proves
#
#  id            :integer          not null, primary key
#  solucion_id   :integer
#  posicion      :integer
#  asignatura_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  profe_id      :integer
#

class SolProfe < ApplicationRecord
    belongs_to :solucion
end
