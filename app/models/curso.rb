# == Schema Information
#
# Table name: cursos
#
#  id              :integer          not null, primary key
#  colegio_id      :integer
#  profesorjefe_id :integer
#  nombre          :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  nivel_id        :integer
#

class Curso < ApplicationRecord
    belongs_to :colegio
    belongs_to :profesorjefe, :required => false, :class_name => "Profesor"
    has_many :curso_musts, :class_name => "Must", :dependent => :destroy
    has_many :curso_cants, 
    belongs_to :nivel
    has_many :horas_por_semanas, :dependent => :destroy
    
    has_many :asignaturas, :through => :horas_por_semanas, :source => :asignatura
    
    validates :nombre, uniqueness: { scope: :colegio_id, message: ": Ya existe un curso con este nombre" }
    
    # devuelve la cantidad de horas sumadas de todas las asignaturas que valen por el ramo para el mineduc
    def calc_horas(ramo_id)
        ret = 0 
        self.asignaturas.where(:ramo_id => ramo_id).each do |asig|
            
            aux1=0
            
            self.horas_por_semanas.where(:asignatura_id => asig.id).each do |horas|
                aux1= aux1+horas.horasporsemana
            end
           ret= ret+aux1 
        end

        return(ret)
    end
    
    # retorna la cantidad de horas de esta asignatura que falta por agendar
    def horas_porasignar(asig_id,solucion)
       # horas requeridas de esta materia en este curso
       req = self.horas_por_semanas.where(:asignatura_id => asig_id).last.horasporsemana
       #horas ya agendadas en esta materia
       agend = solucion.sol_cursos.where(:curso_id => self.id, :asignatura_id => asig_id).count
       return(req-agend)    
    end
    
    
end
