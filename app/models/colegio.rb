# == Schema Information
#
# Table name: colegios
#
#  id         :integer          not null, primary key
#  nombre     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Colegio < ApplicationRecord
    
    has_many :planificadors, :dependent => :destroy
    has_many :coordinadors, :dependent => :destroy
    has_many :departamentos, :dependent => :destroy
    has_many :cursos
    has_many :asignaturas, :dependent => :destroy
    has_many :salas, :dependent => :destroy
    
    has_many :profesors, :through => :departamentos, :source => :profesors
    has_many :tienes, :through => :asignaturas, :source => :tienes
    has_many :curso_musts, :through => :cursos, :source => :curso_musts
end
