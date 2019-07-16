# == Schema Information
#
# Table name: sol_matches
#
#  id            :integer          not null, primary key
#  asignatura_id :integer
#  curso_id      :integer
#  profesor_id   :integer
#  solucion_id   :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class SolMatch < ApplicationRecord
    belongs_to :solucion
end
