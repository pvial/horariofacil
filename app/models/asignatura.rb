# == Schema Information
#
# Table name: asignaturas
#
#  id         :integer          not null, primary key
#  colegio_id :integer
#  ramo_id    :integer
#  nombre     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  sala_id    :integer
#

class Asignatura < ApplicationRecord
    belongs_to :colegio
    has_many :tienes, :dependent => :destroy
    has_many :nopuedes, :dependent => :destroy
    belongs_to :ramo
    belongs_to :sala, :required => false
    has_many :horas_por_semanas, :dependent => :destroy
    has_many :dedicacions, :dependent => :destroy
    
    has_many :profesors, :through => :dedicacions, :source => :profesor
    has_many :cursos, :through => :horas_por_semanas, :source => :curso
    has_many :nivels, :through => :cursos, :source => :nivel
end
