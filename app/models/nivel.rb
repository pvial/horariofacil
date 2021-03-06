# == Schema Information
#
# Table name: nivels
#
#  id         :integer          not null, primary key
#  nombre     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Nivel < ApplicationRecord
  
    has_many :cursos, :dependent => :nullify
    has_many :requerimientos, :dependent => :destroy
    has_many :haces, :dependent => :destroy
    
    has_many :profesors, :through => :haces, :source => :profesor
    
end
