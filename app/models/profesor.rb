# == Schema Information
#
# Table name: profesors
#
#  id              :integer          not null, primary key
#  departamento_id :integer
#  nombre          :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Profesor < ApplicationRecord
    belongs_to :departamento
    has_many :cants, :dependent => :destroy
    has_many :musts, :dependent => :destroy
    has_many :cursos, :foreign_key => "profesorjefe_id"
    has_many :hora_lectivas, :dependent => :destroy
    has_many :haces, :dependent => :destroy
    has_many :dedicacions, :dependent => :destroy
    
    has_one :colegio, :through => :departamento, :source => :colegio
    has_many :asignaturas, :through => :dedicacions, :source => :asignatura
    has_many :nivels, :through => :haces, :source => :nivel
    
    # retorna la cantidad de horas disponibles en esa asignatura que le quedan para ser asignadas al profesor
    def horas_left(asig_id,solucion)
       res = solucion.sol_profes.where(:profe_id => self.id, :asignatura_id => asig_id).count
       return(res)    
    end
    
end
