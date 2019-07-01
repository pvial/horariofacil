# == Schema Information
#
# Table name: modulos
#
#  id         :integer          not null, primary key
#  curso_id   :integer
#  dia_id     :integer
#  activo     :boolean
#  posicion   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Modulo < ApplicationRecord
belongs_to :curso
has_one :tiene, :dependent => :destroy
has_many :nopuedes, :dependent => :destroy
belongs_to :dia, :class_name => "Day"
end
