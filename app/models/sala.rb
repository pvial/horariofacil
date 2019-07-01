# == Schema Information
#
# Table name: salas
#
#  id             :integer          not null, primary key
#  colegio_id     :integer
#  disponibilidad :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  nombre         :string
#

class Sala < ApplicationRecord
    belongs_to :colegio
    has_many :asignaturas, :dependent => :nullify
end
