# == Schema Information
#
# Table name: tienes
#
#  id            :integer          not null, primary key
#  modulo_id     :integer
#  asignatura_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Tiene < ApplicationRecord
    belongs_to :asignatura
    belongs_to :modulo
    
    validates :modulo_id, uniqueness: true
end
