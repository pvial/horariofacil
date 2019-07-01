# == Schema Information
#
# Table name: departamentos
#
#  id         :integer          not null, primary key
#  colegio_id :integer
#  nombre     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Departamento < ApplicationRecord
    
    belongs_to :colegio
    has_one :coordinador, :dependent => :destroy
    has_many :profesors, :dependent => :nullify
    
    has_many :asignaturas, :through => :profesors, :source => :asignaturas
end
