# == Schema Information
#
# Table name: nopuedes
#
#  id            :integer          not null, primary key
#  modulo_id     :integer
#  asignatura_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Nopuede < ApplicationRecord
    belongs_to :asignatura
    belongs_to :modulo
    
    validates :asignatura_id, uniqueness: { scope: :modulo_id, message: "Restricción ya existe" }
end
